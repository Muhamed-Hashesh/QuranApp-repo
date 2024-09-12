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
          TasbihItem(text: 'لا إله إلا الله'),
          TasbihItem(text: 'الله أكبر'),
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
    } else if (selectedIndex < currentItems.length - 1) {
      selectedIndex++;
    }

    emit(state.copyWith(items: currentItems, selectedIndex: selectedIndex));
  }

  void resetCount() {
    final resetItems =
        state.items.map((item) => item.copyWith(count: 0)).toList();
    emit(state.copyWith(items: resetItems, selectedIndex: 0));
  }

  void addNewTasbih(String text, {int limit = 33}) {
    final updatedItems = List<TasbihItem>.from(state.items)
      ..add(TasbihItem(text: text, limit: limit));
    emit(state.copyWith(items: updatedItems));
  }
}
