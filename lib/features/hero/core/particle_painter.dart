import 'dart:math' as math;

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

  static const double connectionDistance = 88;
  static const double connectionDistanceSq =
      connectionDistance * connectionDistance;
  static const double mouseDistance = 110;
  static const double mouseDistanceSq = mouseDistance * mouseDistance;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    final dotPaint = Paint()
      ..color = AppColors.particle.withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    final count = particles.length;

    for (var i = 0; i < count; i++) {
      final a = particles[i];
      final ax = a.position.dx;
      final ay = a.position.dy;
      canvas.drawCircle(a.position, 2.0, dotPaint);

      for (var j = i + 1; j < count; j++) {
        final b = particles[j];
        final dx = ax - b.position.dx;
        final dy = ay - b.position.dy;
        final distanceSq = dx * dx + dy * dy;
        if (distanceSq >= connectionDistanceSq) continue;

        final distance = math.sqrt(distanceSq);
        final opacity = (1 - distance / connectionDistance) * 0.28;
        linePaint.color = AppColors.particleLine.withValues(alpha: opacity);
        canvas.drawLine(a.position, b.position, linePaint);
      }

      if (!mouseInside) continue;

      final mdx = ax - mousePosition.dx;
      final mdy = ay - mousePosition.dy;
      final mouseSq = mdx * mdx + mdy * mdy;
      if (mouseSq >= mouseDistanceSq) continue;

      final distance = math.sqrt(mouseSq);
      final opacity = (1 - distance / mouseDistance) * 0.35;
      linePaint.color = AppColors.particleLine.withValues(alpha: opacity);
      canvas.drawLine(a.position, mousePosition, linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter oldDelegate) => true;
}
