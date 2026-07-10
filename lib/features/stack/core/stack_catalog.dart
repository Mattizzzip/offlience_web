import 'package:offlience_website/features/stack/core/stack_technology.dart';

class StackCatalog {
  StackCatalog._();

  static const List<StackTechnology> technologies = [
    StackTechnology(
      id: 'flutter',
      name: 'Flutter',
      iconAsset: 'assets/icons/flutter.svg',
    ),
    StackTechnology(
      id: 'dart',
      name: 'Dart',
      iconAsset: 'assets/icons/dart.svg',
    ),
    StackTechnology(
      id: 'python',
      name: 'Python',
      iconAsset: 'assets/icons/python.svg',
    ),
    StackTechnology(
      id: 'postgres',
      name: 'Postgres',
      iconAsset: 'assets/icons/postgres.svg',
    ),
    StackTechnology(
      id: 'javascript',
      name: 'JavaScript',
      iconAsset: 'assets/icons/js.svg',
    ),
  ];
}
