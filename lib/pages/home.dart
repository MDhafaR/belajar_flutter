import 'package:belajar_flutter_github/widgets/data_widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Provider"),
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
