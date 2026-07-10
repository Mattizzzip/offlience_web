import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/particle.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class ParticlePainter extends CustomPainter {
  ParticlePainter({
    required this.particles,
    required this.mousePosition,
    required this.mouseInside,
  });

  final List<Particle> particles;
  final Offset mousePosition;
  final bool mouseInside;

  static const double connectionDistance = 110;
  static const double mouseDistance = 140;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()..strokeWidth = 1;
    final dotPaint = Paint()
      ..color = AppColors.particle.withValues(alpha: 0.6);

    for (var i = 0; i < particles.length; i++) {
      final a = particles[i];
      canvas.drawCircle(a.position, 2.2, dotPaint);

      for (var j = i + 1; j < particles.length; j++) {
        final b = particles[j];
        final distance = (a.position - b.position).distance;
        if (distance < connectionDistance) {
          final opacity = (1 - distance / connectionDistance) * 0.3;
          linePaint.color = AppColors.particleLine.withValues(alpha: opacity);
          canvas.drawLine(a.position, b.position, linePaint);
        }
      }

      if (mouseInside) {
        final distance = (a.position - mousePosition).distance;
        if (distance < mouseDistance) {
          final opacity = (1 - distance / mouseDistance) * 0.4;
          linePaint.color = AppColors.particleLine.withValues(alpha: opacity);
          canvas.drawLine(a.position, mousePosition, linePaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
