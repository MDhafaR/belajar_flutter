import 'package:belajar_flutter_github/bloc/count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CountBloc blocCount = BlocProvider.of<CountBloc>(context);

    return BlocConsumer<CountBloc, int>(
      bloc: blocCount,
      listenWhen: (previous, current) {
        if (current % 2 == 0 && current >= 0 && current != 0) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("angka ini genap ke $state"),
          duration: const Duration(seconds: 1),
        ));
      },
      buildWhen: (previous, current) {
        if (current >= 0) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              child: InkWell(
                onTap: () {
                  blocCount.kurangData();
                },
                borderRadius: BorderRadius.circular(15),
                child: const SizedBox(
                  width: 50,
                  height: 70,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 70,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "$state",
                  style: const TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black,
              child: InkWell(
                onTap: () {
                  blocCount.tambahData();
                },
                borderRadius: BorderRadius.circular(15),
                child: const SizedBox(
                  width: 50,
                  height: 70,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
