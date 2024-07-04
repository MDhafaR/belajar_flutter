import 'package:belajar_flutter_github/bloc/login_bloc.dart';
import 'package:belajar_flutter_github/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String username = "";
    String password = "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Center(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return MaineScreen(state.username);
                },
              )); 
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const CircularProgressIndicator();
            }
            if (state is LoginSuccess) {
              return const Center();
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.grey[400],
              ),
              width: 300,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => username = value,
                          decoration: const InputDecoration(
                            hintText: "Username",
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.white),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 5),
                            isDense:
                                true, // untuk memaksa tinggi dari textField
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white, // Mengubah warna border menjadi putih saat TextField tidak fokus
                                  width: 3),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          obscureText: true,
                          onChanged: (value) => password = value,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 5),
                            hintText: "Password",
                            hintStyle:
                                TextStyle(fontSize: 10, color: Colors.white),
                            isDense:
                                true, // untuk memaksa tinggi dari textField
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white, // Mengubah warna border menjadi putih saat TextField tidak fokus
                                  width: 3),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<LoginBloc>()
                            .add(OnSubmit(username, password));
                      },
                      child: const Text("Masuk"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
