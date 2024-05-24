import 'package:belajar_flutter_github/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BelajarCubit());
}

class BelajarCubit extends StatelessWidget {
  const BelajarCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}
