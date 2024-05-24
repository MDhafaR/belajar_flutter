import 'package:belajar_flutter_github/bloc/bloc_service.dart';
import 'package:belajar_flutter_github/pages/page_ke_2.dart';
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
      ),
      body: const Center(child: DataWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    // value: context.read<BlocService>(), // bisa juga seperti ini
                    value: BlocProvider.of<BlocService>(context), // bisa juga seperti ini
                    child: const Page2()
                    )));
        },
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
