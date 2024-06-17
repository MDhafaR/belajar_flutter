import 'dart:async';

abstract class ControlEvent {}

class IncrementEvent extends ControlEvent {}

class DecrementEvent extends ControlEvent {}

class Counter {
  int _value = 0;

  //stream event
  StreamController<ControlEvent> _controlStream =
      StreamController<ControlEvent>();

  StreamSink<ControlEvent> get kirimEvent => _controlStream.sink;
  Stream<ControlEvent> get _terimaEvent => _controlStream.stream;
  //state event
  StreamController<int> _controlState = StreamController<int>();

  StreamSink<int> get _kirimState => _controlState.sink;
  Stream<int> get terimaState => _controlState.stream;
  //mapping event
  void _mappingMethod(ControlEvent event) {
    if (event is IncrementEvent) {
      _value++;
    } else {
      _value--;
    }

    _kirimState.add(_value);
  }

  Counter() {
    _terimaEvent.listen(_mappingMethod);
  }

  //dispose
  void dispose() {
    _controlState.close();
    _controlStream.close();
  }
}
