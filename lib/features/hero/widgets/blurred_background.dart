import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/widgets/blur_blob.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class BlurredBackground extends StatelessWidget {
  const BlurredBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AppColors.background),
        const Positioned(
          top: -80,
          left: -40,
          child: BlurBlob(size: 400, color: Color(0x8C8DA9BC)),
        ),
        const Positioned(
          top: 140,
          right: -80,
          child: BlurBlob(size: 340, color: Color(0x736D7E93)),
        ),
        Positioned(
          bottom: -120,
          left: MediaQuery.sizeOf(context).width * 0.2,
          child: const BlurBlob(size: 480, color: Color(0x8096B0C1)),
        ),
        Positioned(
          bottom: 60,
          right: MediaQuery.sizeOf(context).width * 0.12,
          child: const BlurBlob(size: 280, color: Color(0x668DA9BC)),
        ),
      ],
    );
  }
}
