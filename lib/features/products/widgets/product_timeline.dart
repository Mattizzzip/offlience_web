import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:offlience_website/features/products/core/product.dart';
import 'package:offlience_website/features/products/widgets/product_timeline_content.dart';
import 'package:offlience_website/features/products/widgets/product_timeline_image.dart';
import 'package:offlience_website/features/products/widgets/product_timeline_rail.dart';

class ProductTimeline extends StatelessWidget {
  const ProductTimeline({
    super.key,
    required this.products,
    required this.activeIndex,
    required this.onItemSelected,
  });

  final List<Product> products;
  final int activeIndex;
  final ValueChanged<int> onItemSelected;

  static const double _breakpoint = 960;
  static const double _contentMaxWidth = 1400;

  double _panelHeight(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return math.max(640.0, screenHeight * 0.82);
  }

  @override
  Widget build(BuildContext context) {
    final product = products[activeIndex];
    final isCompact = MediaQuery.sizeOf(context).width < _breakpoint;
    final panelHeight = _panelHeight(context);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isCompact ? 20 : 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
            child: isCompact
                ? _buildCompactLayout(product, panelHeight)
                : _buildDesktopLayout(product, panelHeight),
          ),
        ),
      ),
    );
  }

  double _railHeight(double panelHeight) {
    return math.min(420.0, panelHeight * 0.56);
  }

  Widget _buildDesktopLayout(Product product, double panelHeight) {
    final railHeight = _railHeight(panelHeight);

    return SizedBox(
      height: panelHeight,
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: ProductTimelineImage(
                product: product,
                size: math.min(480.0, panelHeight * 0.62),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Center(
            child: ProductTimelineRail(
              products: products,
              activeIndex: activeIndex,
              onItemSelected: onItemSelected,
              height: railHeight,
            ),
          ),
          const SizedBox(width: 56),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ProductTimelineContent(product: product),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactLayout(Product product, double panelHeight) {
    final railHeight = math.min(200.0, _railHeight(panelHeight) * 0.7);

    return SizedBox(
      height: panelHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProductTimelineRail(
            products: products,
            activeIndex: activeIndex,
            onItemSelected: onItemSelected,
            height: railHeight,
          ),
          const SizedBox(height: 36),
          ProductTimelineImage(
            product: product,
            size: math.min(340.0, panelHeight * 0.45),
          ),
          const SizedBox(height: 36),
          ProductTimelineContent(product: product),
        ],
      ),
    );
  }
}
