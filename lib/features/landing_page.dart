import 'package:flutter/material.dart';
import 'package:offlience_website/features/contact/contact.dart';
import 'package:offlience_website/features/footer/footer.dart';
import 'package:offlience_website/features/hero/hero.dart';
import 'package:offlience_website/features/products/core/products_catalog.dart';
import 'package:offlience_website/features/products/products.dart';
import 'package:offlience_website/features/stack/stack.dart';
import 'package:offlience_website/features/theme/app_colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _productsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _precacheAssets());
  }

  Future<void> _precacheAssets() async {
    if (!mounted) return;
    for (final product in ProductsCatalog.products) {
      await precacheImage(AssetImage(product.imageAsset), context);
      if (!mounted) return;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToProducts() async {
    final context = _productsKey.currentContext;
    if (context == null) return;

    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.sizeOf(context).width < 720;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 12 : 16,
                  vertical: isCompact ? 16 : 24,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1400),
                    child: Column(
                      children: [
                        HeroSection(onDiscoverMore: _scrollToProducts),
                        SizedBox(height: isCompact ? 24 : 32),
                        const StackSection(),
                      ],
                    ),
                  ),
                ),
              ),
              KeyedSubtree(
                key: _productsKey,
                child: const ProductsSection(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 12 : 0,
                ),
                child: const ContactSection(),
              ),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
