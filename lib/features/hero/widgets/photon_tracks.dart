import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/photon_track_painter.dart';

class PhotonTracks extends StatelessWidget {
  const PhotonTracks({super.key, required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            painter: PhotonTrackPainter(progress: controller.value),
            isComplex: true,
            willChange: true,
          );
        },
      ),
    );
  }
}
