import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/widgets/blur_blob.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: AppColors.background),
          Positioned(
            top: -80,
            left: -40,
            child: BlurBlob(size: 400, color: Color(0x8C8DA9BC)),
          ),
          Positioned(
            top: 140,
            right: -80,
            child: BlurBlob(size: 340, color: Color(0x736D7E93)),
          ),
          Align(
            alignment: Alignment(-0.4, 1.35),
            child: BlurBlob(size: 480, color: Color(0x8096B0C1)),
          ),
          Align(
            alignment: Alignment(0.75, 0.7),
            child: BlurBlob(size: 280, color: Color(0x668DA9BC)),
          ),
        ],
      ),
    );
  }
}
