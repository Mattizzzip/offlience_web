import 'package:flutter/material.dart';
import 'package:offlience_website/features/products/core/product.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class ProductTimelineContent extends StatelessWidget {
  const ProductTimelineContent({
    super.key,
    required this.product,
    this.centered = false,
    this.compact = false,
  });

  final Product product;
  final bool centered;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: Column(
        key: ValueKey(product.id),
        crossAxisAlignment:
            centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product.title,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: compact ? 22 : 28,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.6,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.description,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: compact ? 14 : 16,
              fontWeight: FontWeight.w400,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}
