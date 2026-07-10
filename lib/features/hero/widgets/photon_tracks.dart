import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/core/photon_track_painter.dart';

class PhotonTracks extends StatelessWidget {
  const PhotonTracks({super.key, required this.controller});

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(3, (index) {
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 18),
          child: SizedBox(
            width: 2,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: PhotonTrackPainter(
                    progress: (controller.value + index * 0.22) % 1.0,
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
