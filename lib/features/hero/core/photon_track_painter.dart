import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class PhotonTrackPainter extends CustomPainter {
  PhotonTrackPainter({required this.progress});

  final double progress;

  static const int trackCount = 3;
  static const double trackGap = 18;

  @override
  void paint(Canvas canvas, Size size) {
    final totalWidth = (trackCount - 1) * trackGap;
    final startX = (size.width - totalWidth) / 2;

    for (var index = 0; index < trackCount; index++) {
      _paintTrack(
        canvas,
        size,
        startX + index * trackGap,
        (progress + index * 0.22) % 1.0,
      );
    }
  }

  void _paintTrack(Canvas canvas, Size size, double centerX, double progress) {
    final trackPaint = Paint()
      ..color = AppColors.trackLine.withValues(alpha: 0.35)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX, 0),
      Offset(centerX, size.height),
      trackPaint,
    );

    const fadeZoneFraction = 0.18;
    final fadeZone = size.height * fadeZoneFraction;
    final photonLength = size.height * 0.28;
    final travelEnd = size.height - fadeZone;
    final headY = progress * (travelEnd + photonLength);
    final tailTop = headY - photonLength;

    if (headY <= 0) return;

    final bottomFade = headY > travelEnd
        ? (1 - (headY - travelEnd) / fadeZone).clamp(0.0, 1.0)
        : 1.0;

    if (bottomFade <= 0) return;

    final visibleTop = tailTop.clamp(0.0, size.height);
    final visibleBottom = headY.clamp(0.0, size.height);

    if (visibleBottom <= visibleTop) return;

    final photonRect = Rect.fromLTRB(
      centerX - 1,
      visibleTop,
      centerX + 1,
      visibleBottom,
    );

    Color faded(Color color) => color.withValues(alpha: color.a * bottomFade);

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        faded(AppColors.photon.withValues(alpha: 0)),
        faded(AppColors.photon.withValues(alpha: 0.08)),
        faded(AppColors.photon.withValues(alpha: 0.35)),
        faded(AppColors.photon.withValues(alpha: 0.75)),
        faded(AppColors.photon),
      ],
      stops: const [0.0, 0.25, 0.55, 0.82, 1.0],
    );

    final photonPaint = Paint()
      ..shader = gradient.createShader(photonRect)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(centerX, visibleTop),
      Offset(centerX, visibleBottom),
      photonPaint,
    );

    if (visibleBottom > 0 && visibleBottom <= size.height) {
      canvas.drawCircle(
        Offset(centerX, visibleBottom),
        2.2,
        Paint()..color = faded(AppColors.photon.withValues(alpha: 0.45)),
      );
      canvas.drawCircle(
        Offset(centerX, visibleBottom),
        1.2,
        Paint()..color = faded(AppColors.photon),
      );
    }
  }

  @override
  bool shouldRepaint(covariant PhotonTrackPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
