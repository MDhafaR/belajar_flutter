import 'package:belajar_flutter_github/bloc/bloc_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final blocService = BlocService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Cubit'),
      ),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // bloc consumer adalah gabungan dari 
            // penggunaan bloc builder dan bloc listener
            BlocConsumer<BlocService, int>(
              bloc: blocService,
              buildWhen: (previous, current) {
                if (current >= 5) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 30),
                );
              },
              listenWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                } else {
                  return false;
                }
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("data ini genap ke $state"),
                  duration: Duration(seconds: 1),
                ));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      blocService.tambahData();
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      blocService.kurangData();
                    },
                    icon: const Icon(Icons.remove)),
              ],
            )
          ],
        )),
      ),
    );
  }
}
