import 'package:belajar_flutter_github/bloc/bloc_service.dart';
import 'package:belajar_flutter_github/pages/home.dart';
import 'package:belajar_flutter_github/pages/page_ke_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BelajarCubit());
}

class BelajarCubit extends StatelessWidget {
  const BelajarCubit({super.key});

  @override
  Widget build(BuildContext context) {
    BlocService blocService = BlocService();


    return BlocProvider(
      create: (context) => blocService,
      child: MaterialApp(
          routes: {
            "/" :(context) => BlocProvider.value(
              value: blocService,
              child: const Home()),
            "page2" :(context) => BlocProvider.value(
              value: blocService,
              child: const Page2())
          },
        )
    );
  }
}
