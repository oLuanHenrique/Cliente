import 'package:crud_app/components/client_widget.dart';
import 'package:crud_app/data/standard_client.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutosList extends StatelessWidget {
  const ProdutosList({super.key});
  @override
  Widget build(BuildContext context) {
    final ProdutoProvider produtos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Lista de produtos'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.FORMULARIO);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: produtos.contador,
          itemBuilder: (ctx, i) =>
              ClientWidget(cliente: produtos.peloIndice(i))),
    );
  }
}

class ProdutoProvider {
  get contador => null;
  
  peloIndice(int i) {}
}
