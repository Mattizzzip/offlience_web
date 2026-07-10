import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class TimelinePhotonPainter extends CustomPainter {
  TimelinePhotonPainter({
    required this.progress,
    required this.movingForward,
    required this.trackInset,
    this.axis = Axis.vertical,
  });

  final double progress;
  final bool movingForward;
  final double trackInset;
  final Axis axis;

  @override
  void paint(Canvas canvas, Size size) {
    if (axis == Axis.vertical) {
      _paintVertical(canvas, size);
    } else {
      _paintHorizontal(canvas, size);
    }
  }

  void _paintVertical(Canvas canvas, Size size) {
    final center = size.width / 2;
    final trackStart = trackInset;
    final trackEnd = size.height - trackInset;
    final trackLength = trackEnd - trackStart;

    _drawTrackLine(
      canvas,
      Offset(center, trackStart),
      Offset(center, trackEnd),
    );

    final fadeZone = trackLength * 0.14;
    final photonLength = trackLength * 0.22;
    final travelEnd = trackEnd - fadeZone;
    final head = trackStart + progress * (travelEnd - trackStart + photonLength);

    if (movingForward) {
      _paintAlongAxis(
        canvas: canvas,
        center: center,
        trackStart: trackStart,
        trackEnd: trackEnd,
        head: head,
        photonLength: photonLength,
        fadeZone: fadeZone,
        travelEnd: travelEnd,
        forward: true,
        vertical: true,
      );
    } else {
      _paintAlongAxis(
        canvas: canvas,
        center: center,
        trackStart: trackStart,
        trackEnd: trackEnd,
        head: head,
        photonLength: photonLength,
        fadeZone: fadeZone,
        travelEnd: travelEnd,
        forward: false,
        vertical: true,
      );
    }
  }

  void _paintHorizontal(Canvas canvas, Size size) {
    final center = size.height / 2;
    final trackStart = trackInset;
    final trackEnd = size.width - trackInset;
    final trackLength = trackEnd - trackStart;

    _drawTrackLine(
      canvas,
      Offset(trackStart, center),
      Offset(trackEnd, center),
    );

    final fadeZone = trackLength * 0.14;
    final photonLength = trackLength * 0.22;
    final travelEnd = trackEnd - fadeZone;
    final head = trackStart + progress * (travelEnd - trackStart + photonLength);

    if (movingForward) {
      _paintAlongAxis(
        canvas: canvas,
        center: center,
        trackStart: trackStart,
        trackEnd: trackEnd,
        head: head,
        photonLength: photonLength,
        fadeZone: fadeZone,
        travelEnd: travelEnd,
        forward: true,
        vertical: false,
      );
    } else {
      _paintAlongAxis(
        canvas: canvas,
        center: center,
        trackStart: trackStart,
        trackEnd: trackEnd,
        head: head,
        photonLength: photonLength,
        fadeZone: fadeZone,
        travelEnd: travelEnd,
        forward: false,
        vertical: false,
      );
    }
  }

  void _drawTrackLine(Canvas canvas, Offset start, Offset end) {
    final trackPaint = Paint()
      ..color = AppColors.steel.withValues(alpha: 0.35)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(start, end, trackPaint);
  }

  void _paintAlongAxis({
    required Canvas canvas,
    required double center,
    required double trackStart,
    required double trackEnd,
    required double head,
    required double photonLength,
    required double fadeZone,
    required double travelEnd,
    required bool forward,
    required bool vertical,
  }) {
    if (forward) {
      if (head <= trackStart) return;

      final endFade = head > travelEnd
          ? (1 - (head - travelEnd) / fadeZone).clamp(0.0, 1.0)
          : 1.0;
      if (endFade <= 0) return;

      final tail = head - photonLength;
      final visibleStart = tail.clamp(trackStart, trackEnd);
      final visibleEnd = head.clamp(trackStart, trackEnd);
      if (visibleEnd <= visibleStart) return;

      _drawStreak(
        canvas: canvas,
        center: center,
        visibleStart: visibleStart,
        visibleEnd: visibleEnd,
        fade: endFade,
        brightAtEnd: true,
        vertical: vertical,
      );
      return;
    }

    if (head >= trackEnd) return;

    final startFade = head < trackStart + fadeZone
        ? ((head - trackStart) / fadeZone).clamp(0.0, 1.0)
        : 1.0;
    if (startFade <= 0) return;

    final tail = head + photonLength;
    final visibleStart = head.clamp(trackStart, trackEnd);
    final visibleEnd = tail.clamp(trackStart, trackEnd);
    if (visibleEnd <= visibleStart) return;

    _drawStreak(
      canvas: canvas,
      center: center,
      visibleStart: visibleStart,
      visibleEnd: visibleEnd,
      fade: startFade,
      brightAtEnd: false,
      vertical: vertical,
    );
  }

  void _drawStreak({
    required Canvas canvas,
    required double center,
    required double visibleStart,
    required double visibleEnd,
    required double fade,
    required bool brightAtEnd,
    required bool vertical,
  }) {
    final rect = vertical
        ? Rect.fromLTRB(center - 1, visibleStart, center + 1, visibleEnd)
        : Rect.fromLTRB(visibleStart, center - 1, visibleEnd, center + 1);

    Color faded(Color color) => color.withValues(alpha: color.a * fade);

    final colors = brightAtEnd
        ? [
            faded(AppColors.gold.withValues(alpha: 0)),
            faded(AppColors.gold.withValues(alpha: 0.15)),
            faded(AppColors.gold.withValues(alpha: 0.5)),
            faded(AppColors.gold.withValues(alpha: 0.85)),
            faded(AppColors.gold),
          ]
        : [
            faded(AppColors.gold),
            faded(AppColors.gold.withValues(alpha: 0.85)),
            faded(AppColors.gold.withValues(alpha: 0.5)),
            faded(AppColors.gold.withValues(alpha: 0.15)),
            faded(AppColors.gold.withValues(alpha: 0)),
          ];

    final gradient = LinearGradient(
      begin: vertical ? Alignment.topCenter : Alignment.centerLeft,
      end: vertical ? Alignment.bottomCenter : Alignment.centerRight,
      colors: colors,
      stops: const [0.0, 0.25, 0.55, 0.82, 1.0],
    );

    final streakPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    if (vertical) {
      canvas.drawLine(
        Offset(center, visibleStart),
        Offset(center, visibleEnd),
        streakPaint,
      );
    } else {
      canvas.drawLine(
        Offset(visibleStart, center),
        Offset(visibleEnd, center),
        streakPaint,
      );
    }

    final headPos = brightAtEnd ? visibleEnd : visibleStart;
    final headOffset =
        vertical ? Offset(center, headPos) : Offset(headPos, center);

    final headPaint = Paint()
      ..color = faded(AppColors.gold)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
    canvas.drawCircle(headOffset, 2.5, headPaint);
    canvas.drawCircle(
      headOffset,
      1.4,
      Paint()..color = faded(AppColors.gold),
    );
  }

  @override
  bool shouldRepaint(covariant TimelinePhotonPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.movingForward != movingForward ||
        oldDelegate.trackInset != trackInset ||
        oldDelegate.axis != axis;
  }
}
