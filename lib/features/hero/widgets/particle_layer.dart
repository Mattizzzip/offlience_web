import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/mouse_tracker.dart';
import 'package:offlience_website/features/hero/core/particle_painter.dart';
import 'package:offlience_website/features/hero/core/particle_simulation.dart';

class ParticleLayer extends StatelessWidget {
  const ParticleLayer({
    super.key,
    required this.size,
    required this.simulation,
    required this.mouseTracker,
    required this.controller,
  });

  final Size size;
  final ParticleSimulation simulation;
  final MouseTracker mouseTracker;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    simulation.init(size, count: ParticleSimulation.defaultCount);

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          simulation.update();
          return CustomPaint(
            painter: ParticlePainter(
              particles: simulation.particles,
              mousePosition: mouseTracker.position,
              mouseInside: mouseTracker.isInside,
            ),
            size: size,
            isComplex: true,
            willChange: true,
          );
        },
      ),
    );
  }
}
