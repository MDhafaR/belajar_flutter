import 'package:bloc/bloc.dart';

class BlocService extends Cubit<int> {
  BlocService() : super(0);

  tambahData() {
    emit(state + 1);
  }

  kurangData() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
