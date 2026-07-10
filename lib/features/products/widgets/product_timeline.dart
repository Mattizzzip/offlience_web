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
    return math.max(480.0, screenHeight * 0.58);
  }

  @override
  Widget build(BuildContext context) {
    final product = products[activeIndex];
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < _breakpoint;
    final panelHeight = _panelHeight(context);

    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isCompact ? 20 : 48),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
            child: isCompact
                ? _buildCompactLayout(context, product)
                : _buildDesktopLayout(product, panelHeight),
          ),
        ),
      ),
    );
  }

  double _railHeight(double panelHeight) {
    return math.min(380.0, panelHeight * 0.72);
  }

  Widget _buildDesktopLayout(Product product, double panelHeight) {
    final railHeight = _railHeight(panelHeight);

    return SizedBox(
      height: panelHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ProductTimelineImage(
                product: product,
                size: math.min(440.0, panelHeight * 0.72),
              ),
            ),
          ),
          const SizedBox(width: 48),
          ProductTimelineRail(
            products: products,
            activeIndex: activeIndex,
            onItemSelected: onItemSelected,
            extent: railHeight,
            axis: Axis.vertical,
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

  Widget _buildCompactLayout(BuildContext context, Product product) {
    final railWidth = math.min(
      MediaQuery.sizeOf(context).width - 40,
      320.0,
    );

    return Column(
      children: [
        ProductTimelineImage(
          product: product,
          size: math.min(240.0, MediaQuery.sizeOf(context).width * 0.55),
        ),
        const SizedBox(height: 28),
        ProductTimelineRail(
          products: products,
          activeIndex: activeIndex,
          onItemSelected: onItemSelected,
          extent: railWidth,
          axis: Axis.horizontal,
        ),
        const SizedBox(height: 24),
        ProductTimelineContent(
          product: product,
          centered: true,
          compact: true,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
