import 'package:belajar_flutter_github/bloc/product_bloc.dart';
import 'package:belajar_flutter_github/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Latihan Get Data Use Bloc"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductSuccess) {
              List<Product> products = state.result;
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GridTile(
                    footer: Container(
                      color: Colors.black38,
                      child: Text(product.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 25, color: Colors.white),),
                    ),
                    child: Image.network(product.imageUrl, fit: BoxFit.cover,)
                    );
                },
              );
            }
            return const Center(
              child: Text("No Data!"),
            );
          },
        ),
      ),
    );
  }
}
