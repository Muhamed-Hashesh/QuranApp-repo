import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_project/views/sebha_screen/model/sebha_list.dart';

part 'sebha_state.dart';

class SebhaCubit extends Cubit<SebhaState> {
  SebhaCubit() : super(SebhaInitial());

  String? sebhaItem;
  String shownText = 'قم باختيار تسبيحة للبدء';
  int counter = 0;
  int selectedIndex = -1;

  void chooseTsbeha({required int index}) {
    // shownText = sebhaList[index]['text'];
    selectedIndex = selectedIndex == index ? -1 : index;
    emit(SebhaTextChanged());
  }

  void increaseCounter({required int index}) {
    // if (counter < sebhaList[index]['count']) {
    counter++;
    // }
    emit(SebhaIncrease());
  }
}
