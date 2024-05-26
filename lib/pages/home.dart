import 'package:belajar_flutter_github/bloc/theme_bloc.dart';
import 'package:belajar_flutter_github/widgets/data_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).ubahTema();
              },
              icon: Icon(Icons.mood))
        ],
      ),
      body: const Center(child: DataWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "page2");
        },
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
