import 'package:flutter/material.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:crud_app/views/clients_list.dart';
import 'package:crud_app/views/produtos_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.CLIENTES);
              },
              child: const Text('Lista de Clientes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.PRODUTOS);
              },
              child: const Text('Lista de Produtos'),
            ),
          ],
        ),
      ),
    );
  }
}
