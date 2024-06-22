import 'package:belajar_flutter_github/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                create: (context) => DataBloc(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<DataBloc, StateResult>(
                      builder: (context, state) {
                        String? hasil;
                        if (state is StateInit) {
                          hasil = state.initial;
                        }
                        if (state is StateLoading) {
                          return CircularProgressIndicator();
                        }
                        if (state is StateSuccess) {
                          hasil = state.result;
                        }
                        return Container(
                          width: 300,
                          child: Text(
                            "$hasil",
                            style: TextStyle(fontSize: 35),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Builder(
                      builder: (context) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  context.read<DataBloc>().add(GetData());
                                },
                                child: const Text("get data")),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<DataBloc>(context).add(NoData());
                                },
                                child: const Text("no data")),
                          ],
                        );
                      }
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}
