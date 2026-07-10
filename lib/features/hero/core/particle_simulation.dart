import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/particle.dart';

class ParticleSimulation {
  final List<Particle> particles = [];
  Size canvasSize = Size.zero;

  void init(Size size, {int count = 150, int seed = 42}) {
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
    for (final particle in particles) {
      particle.position += particle.velocity;

      if (particle.position.dx < 0 || particle.position.dx > canvasSize.width) {
        particle.velocity = Offset(-particle.velocity.dx, particle.velocity.dy);
      }
      if (particle.position.dy < 0 ||
          particle.position.dy > canvasSize.height) {
        particle.velocity = Offset(particle.velocity.dx, -particle.velocity.dy);
      }

      particle.position = Offset(
        particle.position.dx.clamp(0.0, canvasSize.width),
        particle.position.dy.clamp(0.0, canvasSize.height),
      );
    }
  }
}
