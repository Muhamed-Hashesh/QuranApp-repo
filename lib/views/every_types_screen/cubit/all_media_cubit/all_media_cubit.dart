import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_media_state.dart';

class AllMediaCubit extends Cubit<AllMediaState> {
  AllMediaCubit() : super(AllMediaInitial());
}
