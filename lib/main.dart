import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      // scaffoldMessenger itu adalah milik scaffold,
                      //jadi jika ingin menggunakan nya itu kita butuh context dari widget scaffold
                      //kita bisa meminta context dari scaffold itu menggunakan widget builder
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Ini muncul")));
                    },
                    child: const Text("SnackBar"));
              }),
              Builder(builder: (context) {
                // navigation pun sama, 
                //kita butuh context dari materialApp untuk bisa menggunakan navigator
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewPage(),
                          ));
                    },
                    child: const Text("Next Page"));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Ini baru"),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali"))
        ],
      )),
    );
  }
}
