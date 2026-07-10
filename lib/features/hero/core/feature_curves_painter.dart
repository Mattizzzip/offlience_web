import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FeatureCurvesPainter extends CustomPainter {
  const FeatureCurvesPainter({
    required this.insetX,
    required this.insetY,
  });

  final double insetX;
  final double insetY;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.slate.withValues(alpha: 0.22)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final curves = [
      (
        Offset(insetX + 40, insetY + 20),
        Offset(size.width * 0.38, size.height * 0.38),
        -30.0,
      ),
      (
        Offset(insetX + 40, size.height - insetY - 20),
        Offset(size.width * 0.36, size.height * 0.58),
        30.0,
      ),
      (
        Offset(size.width - insetX - 40, insetY + 20),
        Offset(size.width * 0.62, size.height * 0.38),
        -30.0,
      ),
      (
        Offset(size.width - insetX - 40, size.height - insetY - 20),
        Offset(size.width * 0.64, size.height * 0.58),
        30.0,
      ),
    ];

    for (final (start, end, bend) in curves) {
      final control = Offset(
        (start.dx + end.dx) / 2,
        (start.dy + end.dy) / 2 + bend,
      );

      canvas.drawPath(
        Path()
          ..moveTo(start.dx, start.dy)
          ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant FeatureCurvesPainter oldDelegate) {
    return oldDelegate.insetX != insetX || oldDelegate.insetY != insetY;
  }
}
