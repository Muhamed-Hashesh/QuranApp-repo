import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_project/views/sebha_screen/model/sebha_list.dart';
import 'package:quran_project/views/sebha_screen/model/tasbih-model.dart';

part 'sebha_state.dart';

// class TasbihCubit extends Cubit<TasbihState> {
//   TasbihCubit()
//       : super(TasbihInitial(items: [
//           TasbihItem(text: 'سبحان الله'),
//           TasbihItem(text: 'الحمد لله'),
//           TasbihItem(text: 'لا إله إلا الله'),
//           TasbihItem(text: 'الله أكبر'),
//         ]));

//   void incrementCount() {
//     final currentItems = List<TasbihItem>.from((state as TasbihInitial).items);
//     var currentIndex = (state as TasbihInitial).currentIndex;

//     if (currentItems[currentIndex].count < currentItems[currentIndex].limit) {
//       currentItems[currentIndex] = currentItems[currentIndex].copyWith(
//         count: currentItems[currentIndex].count + 1,
//       );
//     } else if (currentIndex < currentItems.length - 1) {
//       currentIndex++;
//     }

//     emit(TasbihInitial(items: currentItems, currentIndex: currentIndex));
//   }

//   void resetCount() {
//     final resetItems = (state as TasbihInitial)
//         .items
//         .map((item) => item.copyWith(count: 0))
//         .toList();
//     emit(TasbihInitial(items: resetItems, currentIndex: 0));
//   }

//   void addNewTasbih(String text, {int limit = 33}) {
//     final updatedItems = List<TasbihItem>.from((state as TasbihInitial).items)
//       ..add(TasbihItem(text: text, limit: limit));
//     emit(TasbihInitial(items: updatedItems));
//   }
// }

//----------------------------------------------------------------

class TasbihCubit extends Cubit<TasbihState> {
  TasbihCubit()
      : super(TasbihState(items: [
          TasbihItem(text: 'سبحان الله'),
          TasbihItem(text: 'الحمد لله'),
          TasbihItem(text: 'الله أكبر'),
          TasbihItem(text: 'لا إله إلا الله'),
        ]));

  void selectItem(int index) {
    if (index >= 0 && index < state.items.length) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  void incrementCount() {
    final currentItems = List<TasbihItem>.from(state.items);
    var selectedIndex = state.selectedIndex;

    if (currentItems[selectedIndex].count < currentItems[selectedIndex].limit) {
      currentItems[selectedIndex] = currentItems[selectedIndex].copyWith(
        count: currentItems[selectedIndex].count + 1,
      );
    } else {
      // Find the next item that hasn't reached its limit
      final nextIndex =
          currentItems.indexWhere((item) => item.count < item.limit);
      if (nextIndex != -1) {
        selectedIndex = nextIndex;
        currentItems[selectedIndex] = currentItems[selectedIndex].copyWith(
          count: currentItems[selectedIndex].count + 1,
        );
      }
    }

    emit(state.copyWith(items: currentItems, selectedIndex: selectedIndex));
  }

  void resetSelectedCount() {
    final currentItems = List<TasbihItem>.from(state.items);
    currentItems[state.selectedIndex] =
        currentItems[state.selectedIndex].copyWith(count: 0);
    emit(state.copyWith(items: currentItems));
  }
}
