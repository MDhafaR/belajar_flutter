import 'dart:ffi';

import 'package:belajar_flutter_github/controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Counter hitung = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Belajar Alur Stream For Bloc"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder<int>(
                  stream: hitung.terimaState,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  }
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          hitung.kirimEvent.add(IncrementEvent());
                        },
                        child: const Text("Increment")),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          hitung.kirimEvent.add(DecrementEvent());
                        }, child: const Text("Decrement")),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
