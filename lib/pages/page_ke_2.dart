import 'package:belajar_flutter_github/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.fork_left)),
        centerTitle: true,
        title: const Text("Ini page ke 2"),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<CountBloc>(context),
          builder: (context, state) {
            return Text(
            "$state",
            style: const TextStyle(fontSize: 50, color: Colors.black),
          );}
        ),
      ),
    );
  }
}
