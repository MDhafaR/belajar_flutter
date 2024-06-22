import 'package:belajar_flutter_github/models/dummy_data.dart';
import 'package:belajar_flutter_github/models/product.dart';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<OnEventData>((event, emit) async {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 2));
      emit(ProductSuccess(DummyData().data));
    });
  }
}
