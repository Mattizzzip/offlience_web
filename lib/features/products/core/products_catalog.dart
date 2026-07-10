import 'package:offlience_website/features/products/core/product.dart';

class ProductsCatalog {
  ProductsCatalog._();

  static const String sectionTitle = 'What We Build';

  static const String sectionDescription =
      'We bring your startup idea to life, build a product tailored to your '
      'business, or solve a specific challenge your company is facing.';

  static const List<Product> products = [
    Product(
      id: 'mobile',
      title: 'Mobile Applications',
      imageAsset: 'assets/images/mobile_apps.png',
      description:
          'Native and cross-platform iOS and Android apps — fast, reliable, '
          'and built to scale with your audience.',
    ),
    Product(
      id: 'web',
      title: 'Web Application Development',
      imageAsset: 'assets/images/1783625052587.png',
      description:
          'Web platforms, dashboards, and SaaS products with thoughtful '
          'architecture and scalable infrastructure.',
    ),
    Product(
      id: 'individual',
      title: 'Custom Projects',
      imageAsset: 'assets/images/complex_desigion.png',
      description:
          'End-to-end solutions built around your goals — from investor-ready '
          'MVPs to enterprise systems with integrations, automation, and '
          'offline-first logic. We cover the full cycle: idea, design, '
          'development, launch, and ongoing support.',
    ),
  ];
}
