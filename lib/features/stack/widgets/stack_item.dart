import 'package:flutter/material.dart';
import 'package:offlience_website/features/stack/core/stack_technology.dart';
import 'package:offlience_website/features/stack/widgets/stack_logo.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class StackItem extends StatelessWidget {
  const StackItem({
    super.key,
    required this.technology,
    this.spacing = 88,
  });

  final StackTechnology technology;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing / 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StackLogo(iconAsset: technology.iconAsset),
          const SizedBox(width: 12),
          Text(
            technology.name,
            style: const TextStyle(
              color: AppColors.slate,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}
