import 'package:flutter/material.dart';
import 'package:offlience_website/features/hero/widgets/feature_dot.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class FeaturePoint extends StatelessWidget {
  const FeaturePoint({
    super.key,
    required this.title,
    required this.subtitle,
    required this.alignRight,
  });

  final String title;
  final String subtitle;
  final bool alignRight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (alignRight) ...[
          _buildText(),
          const SizedBox(width: 10),
          const FeatureDot(),
        ] else ...[
          const FeatureDot(),
          const SizedBox(width: 10),
          _buildText(),
        ],
      ],
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
