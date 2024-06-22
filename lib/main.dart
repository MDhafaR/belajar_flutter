import 'package:belajar_flutter_github/bloc/product_bloc.dart';
import 'package:belajar_flutter_github/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(OnEventData()),
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
