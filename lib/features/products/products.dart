import 'package:flutter/material.dart';
import 'package:offlience_website/features/products/core/products_catalog.dart';
import 'package:offlience_website/features/products/widgets/product_timeline.dart';
import 'package:offlience_website/features/products/widgets/products_section_header.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => ProductsSectionState();
}

class ProductsSectionState extends State<ProductsSection> {
  int _activeIndex = 0;

  void _onItemSelected(int index) {
    if (_activeIndex == index) return;
    setState(() => _activeIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 720;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isCompact ? 20 : 24),
          child: ProductsSectionHeader(
            title: ProductsCatalog.sectionTitle,
            description: ProductsCatalog.sectionDescription,
          ),
        ),
        SizedBox(height: isCompact ? 24 : 8),
        ProductTimeline(
          products: ProductsCatalog.products,
          activeIndex: _activeIndex,
          onItemSelected: _onItemSelected,
        ),
      ],
    );
  }
}
