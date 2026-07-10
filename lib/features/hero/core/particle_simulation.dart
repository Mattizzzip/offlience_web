import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/particle.dart';

class ParticleSimulation {
  final List<Particle> particles = [];
  Size canvasSize = Size.zero;

  static const int defaultCount = 42;

  void init(Size size, {int count = defaultCount, int seed = 42}) {
    if (particles.isNotEmpty && canvasSize == size) return;

    canvasSize = size;
    particles.clear();

    final random = math.Random(seed);

    for (var i = 0; i < count; i++) {
      particles.add(
        Particle(
          position: Offset(
            random.nextDouble() * size.width,
            random.nextDouble() * size.height,
          ),
          velocity: Offset(
            (random.nextDouble() - 0.5) * 0.35,
            (random.nextDouble() - 0.5) * 0.35,
          ),
        ),
      );
    }
  }

  void update() {
    final width = canvasSize.width;
    final height = canvasSize.height;

    for (final particle in particles) {
      var dx = particle.position.dx + particle.velocity.dx;
      var dy = particle.position.dy + particle.velocity.dy;
      var vx = particle.velocity.dx;
      var vy = particle.velocity.dy;

      if (dx < 0) {
        dx = 0;
        vx = -vx;
      } else if (dx > width) {
        dx = width;
        vx = -vx;
      }

      if (dy < 0) {
        dy = 0;
        vy = -vy;
      } else if (dy > height) {
        dy = height;
        vy = -vy;
      }

      particle.position = Offset(dx, dy);
      particle.velocity = Offset(vx, vy);
    }
  }
}
