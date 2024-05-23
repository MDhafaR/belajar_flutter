import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BelajarCubit());
}

class BlocService extends Cubit<int> {
  BlocService() : super(0);

  tambahData() {
    emit(state + 1);
  }

  kurangData() {
    emit(state - 1);
  }
}

class BelajarCubit extends StatelessWidget {
  BlocService blocService = BlocService();
  BelajarCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Bloc'),
        ),
        body: SafeArea(
          child: Center(
            child: StreamBuilder(
                initialData: "Loading...",
                stream: blocService.stream,
                builder: (context, snapShot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapShot.data.toString(), style: TextStyle(fontSize: 30),),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                blocService.tambahData();
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                blocService.kurangData();
                              },
                              icon: Icon(Icons.minimize_outlined)),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
