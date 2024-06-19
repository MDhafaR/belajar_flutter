import 'dart:ffi';

import 'package:belajar_flutter_github/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Belajar Alur Stream For Bloc"),
          ),
          body: Center(
            child: BlocProvider(
              create: (context) => CounterBloc(),
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$state",
                        style: TextStyle(fontSize: 50),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(CounterEvent.increment);
                              },
                              child: const Text("Increment")),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                context.read<CounterBloc>().add(CounterEvent.decrement);
                              }, child: const Text("Decrement")),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
