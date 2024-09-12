part of 'sebha_cubit.dart';

/*
@immutable
sealed class TasbihState {
  const TasbihState();

  @override
  List<Object> get props => [];
}

final class TasbihInitial extends TasbihState {
  final List<TasbihItem> items;
  final int currentIndex;

  const TasbihInitial({
    required this.items,
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [items, currentIndex];
}
*/
//-------------------------------------------------------------------------------

class TasbihState {
  final List<TasbihItem> items;
  final int selectedIndex;

  const TasbihState({required this.items, this.selectedIndex = 0});

  @override
  List<Object> get props => [items, selectedIndex];

  TasbihState copyWith({List<TasbihItem>? items, int? selectedIndex}) {
    return TasbihState(
      items: items ?? this.items,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
