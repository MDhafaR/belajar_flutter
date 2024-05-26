import 'package:belajar_flutter_github/bloc/bloc_service.dart';
import 'package:belajar_flutter_github/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocService blocService = BlocProvider.of<BlocService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("belajar bloc selector"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<BlocService, User, String>(
              selector: (state) {
                return state.name ?? "-";
              },
              builder: (context, state) {
                return Text("Nama : $state");
              },
            ),
            BlocSelector<BlocService, User, int>(
              selector: (state) {
                return state.age ?? 0;
              },
              builder: (context, state) {
                return Text("Umur : $state Tahun");
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => blocService.ubahNama(value),
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Text("Atur umur mu")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      blocService.ubahUmur(blocService.state.age! - 1);
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      blocService.ubahUmur(blocService.state.age! + 1);
                    },
                    icon: Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
