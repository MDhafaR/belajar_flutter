import 'package:belajar_flutter_github/bloc/login_bloc.dart';
import 'package:belajar_flutter_github/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaineScreen extends StatelessWidget {
  const MaineScreen(this.username, {super.key});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(username),
        actions: [
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Your Loged Out!")));
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ));
                context.read<LoginBloc>().add(OnBack());
              },
              icon: const Icon(Icons.door_back_door))
        ],
      ),
      body: const Center(),
    );
  }
}
