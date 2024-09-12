class TasbihItem {
  final String text;
  final int count;
  final int limit;

  TasbihItem({required this.text, this.count = 0, this.limit = 33});

  TasbihItem copyWith({String? text, int? count, int? limit}) {
    return TasbihItem(
      text: text ?? this.text,
      count: count ?? this.count,
      limit: limit ?? this.limit,
    );
  }
}
