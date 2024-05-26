import 'package:belajar_flutter_github/models/user.dart';
import 'package:bloc/bloc.dart';

class BlocService extends Cubit<User> {
  BlocService() : super(User(name: "-", age: 0));

  ubahNama(String name) {
    emit(User(name: name, age: state.age));
  }

  ubahUmur(int age) {
    if (age >= 0) {
      emit(User(name: state.name, age: age));
    }
  }
}
