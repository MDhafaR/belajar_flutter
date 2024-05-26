import 'package:bloc/bloc.dart';

class CountBloc extends Cubit<int> {
  CountBloc() : super(0);

  tambahData() {
    emit(state + 1);
  }

  kurangData() {
    if (state > 0) {
      emit(state - 1);
    }
  }
}
