import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class TimelinePhotonPainter extends CustomPainter {
  TimelinePhotonPainter({
    required this.progress,
    required this.movingDown,
    required this.trackInset,
  });

  final double progress;
  final bool movingDown;
  final double trackInset;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final trackTop = trackInset;
    final trackBottom = size.height - trackInset;
    final trackHeight = trackBottom - trackTop;

    final trackPaint = Paint()
      ..color = AppColors.steel.withValues(alpha: 0.35)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX, trackTop),
      Offset(centerX, trackBottom),
      trackPaint,
    );

    const fadeZoneFraction = 0.14;
    final fadeZone = trackHeight * fadeZoneFraction;
    final photonLength = trackHeight * 0.22;
    final travelEnd = trackBottom - fadeZone;
    final headY = trackTop + progress * (travelEnd - trackTop + photonLength);

    if (movingDown) {
      _paintPhotonDown(
        canvas,
        centerX,
        trackTop,
        trackBottom,
        headY,
        photonLength,
        fadeZone,
        travelEnd,
      );
    } else {
      _paintPhotonUp(
        canvas,
        centerX,
        trackTop,
        trackBottom,
        headY,
        photonLength,
        fadeZone,
      );
    }
  }

  void _paintPhotonDown(
    Canvas canvas,
    double centerX,
    double trackTop,
    double trackBottom,
    double headY,
    double photonLength,
    double fadeZone,
    double travelEnd,
  ) {
    if (headY <= trackTop) return;

    final bottomFade = headY > travelEnd
        ? (1 - (headY - travelEnd) / fadeZone).clamp(0.0, 1.0)
        : 1.0;

    if (bottomFade <= 0) return;

    final tailTop = headY - photonLength;
    final visibleTop = tailTop.clamp(trackTop, trackBottom);
    final visibleBottom = headY.clamp(trackTop, trackBottom);

    if (visibleBottom <= visibleTop) return;

    _drawStreak(canvas, centerX, visibleTop, visibleBottom, bottomFade, true);
  }

  void _paintPhotonUp(
    Canvas canvas,
    double centerX,
    double trackTop,
    double trackBottom,
    double headY,
    double photonLength,
    double fadeZone,
  ) {
    if (headY >= trackBottom) return;

    final topFade = headY < trackTop + fadeZone
        ? ((headY - trackTop) / fadeZone).clamp(0.0, 1.0)
        : 1.0;

    if (topFade <= 0) return;

    final tailBottom = headY + photonLength;
    final visibleTop = headY.clamp(trackTop, trackBottom);
    final visibleBottom = tailBottom.clamp(trackTop, trackBottom);

    if (visibleBottom <= visibleTop) return;

    _drawStreak(canvas, centerX, visibleTop, visibleBottom, topFade, false);
  }

  void _drawStreak(
    Canvas canvas,
    double centerX,
    double visibleTop,
    double visibleBottom,
    double fade,
    bool brightAtBottom,
  ) {
    final rect = Rect.fromLTRB(centerX - 1, visibleTop, centerX + 1, visibleBottom);

    Color faded(Color color) => color.withValues(alpha: color.a * fade);

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: brightAtBottom
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
            ],
      stops: const [0.0, 0.25, 0.55, 0.82, 1.0],
    );

    final streakPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX, visibleTop),
      Offset(centerX, visibleBottom),
      streakPaint,
    );

    final headY = brightAtBottom ? visibleBottom : visibleTop;
    final headPaint = Paint()
      ..color = faded(AppColors.gold)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
    canvas.drawCircle(Offset(centerX, headY), 2.5, headPaint);
    canvas.drawCircle(
      Offset(centerX, headY),
      1.4,
      Paint()..color = faded(AppColors.gold),
    );
  }

  @override
  bool shouldRepaint(covariant TimelinePhotonPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.movingDown != movingDown ||
        oldDelegate.trackInset != trackInset;
  }
}
