import 'package:belajar_flutter_github/bloc/count_bloc.dart';
import 'package:belajar_flutter_github/bloc/theme_bloc.dart';
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
    CountBloc blocCount = CountBloc();
    ThemeBloc themeBloc = ThemeBloc();


    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => blocCount,),
      BlocProvider(create: (context) => themeBloc,),
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return MaterialApp(
              theme: state == true ? ThemeData.light() : ThemeData.dark(),
                routes: {
                  "/" :(context) => const Home(),
                  "page2" :(context) => const Page2()
                },
              );
        },
      )
    );
  }
}
