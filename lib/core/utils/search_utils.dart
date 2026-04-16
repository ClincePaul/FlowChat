class SearchUtils {
  static List<T> search<T>({
    required List<T> items,
    required String query,
    required String Function(T) name,
    required String Function(T) code,
  }) {
    final q = query.toLowerCase().trim();

    return items
        .where((item) {
          final n = name(item).toLowerCase();
          final c = code(item).toLowerCase();

          return n.contains(q) || c.contains(q);
        })
        .toList()
      ..sort((a, b) {
        int score(T item) {
          final n = name(item).toLowerCase();
          final c = code(item).toLowerCase();

          if (n == q || c == q) return 0;
          return 1;
        }

        return score(a).compareTo(score(b));
      });
  }
}