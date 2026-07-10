import 'package:flutter/material.dart';
import 'package:offlience_website/features/products/core/product.dart';

class ProductTimelineImage extends StatelessWidget {
  const ProductTimelineImage({
    super.key,
    required this.product,
    this.size = 420,
  });

  final Product product;
  final double size;

  @override
  Widget build(BuildContext context) {
    final cacheSize =
        (size * MediaQuery.devicePixelRatioOf(context)).round().clamp(1, 2048);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 450),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: SizedBox(
        key: ValueKey(product.id),
        width: size,
        height: size,
        child: Image.asset(
          product.imageAsset,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.medium,
          cacheWidth: cacheSize,
          cacheHeight: cacheSize,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
