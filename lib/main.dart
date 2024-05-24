import 'package:belajar_flutter_github/bloc/bloc_service.dart';
import 'package:belajar_flutter_github/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BelajarCubit());
}

class BelajarCubit extends StatelessWidget {
  const BelajarCubit({super.key});

  @override
  Widget build(BuildContext context) {
    // jika bloc provider ingin digunakan, 
    // dia harus berada di atas widget sebelum sang bloc provider itu digunakan
    return BlocProvider(
      create: (context) => BlocService(),
      child: const MaterialApp(
        home: Home()
      ),
    );
  }
}
