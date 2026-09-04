class LegalSection {
  const LegalSection({
    required this.title,
    this.body = '',
    this.bulletGroups = const [],
    this.bullets = const [],
    this.table,
    this.trailingBody = '',
  });

  final String title;
  final String body;
  final List<LegalBulletGroup> bulletGroups;
  final List<String> bullets;
  final LegalTable? table;
  final String trailingBody;
}

class LegalBulletGroup {
  const LegalBulletGroup({required this.heading, required this.items});

  final String heading;
  final List<String> items;
}

class LegalTable {
  const LegalTable({required this.headers, required this.rows});

  final List<String> headers;
  final List<List<String>> rows;
}
