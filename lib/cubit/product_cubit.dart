import 'package:belajar_flutter_github/models/dummy_data.dart';
import 'package:belajar_flutter_github/models/product.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProductData() async {
    emit(ProductLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(ProductSuccess(DummyData().data));
  }
}
