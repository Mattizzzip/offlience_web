import 'package:flutter/material.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FeatureDot extends StatelessWidget {
  const FeatureDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gold,
      ),
    );
  }
}
