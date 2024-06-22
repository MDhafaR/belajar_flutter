import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EventData {}

class GetData extends EventData {}

class NoData extends EventData {}

abstract class StateResult {}

class StateLoading extends StateResult {}

class StateSuccess extends StateResult {
  String? result;

  StateSuccess(this.result);
}

class StateInit extends StateResult {
  String initial = "Data ini kosong";
}

class DataBloc extends Bloc<EventData, StateResult> {
  DataBloc() : super(StateInit()) {
    on<EventData>((event, emit) async {
      if (event is GetData) {
        emit(StateLoading());
        await Future.delayed(Duration(seconds: 2));
        emit(StateSuccess("Muhammad Dhafa Ramadhani"));
      }
      if (event is NoData) {
        emit(StateLoading());
        await Future.delayed(Duration(seconds: 2));
        emit(StateInit());
      }
    });
  }
}
