import 'package:flutter/material.dart';
import 'package:crud_app/components/produto_widget.dart'; 
import 'package:crud_app/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:crud_app/models/produto.dart';
import 'package:crud_app/providers/produto_provider.dart';

class ProdutosList extends StatelessWidget {
  const ProdutosList({Key? key}) : super(key: key);

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
              Navigator.of(context).pushNamed(Routes.FORMULARIO_PRODUTO);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.contador,
        itemBuilder: (ctx, i) => ProdutoWidget(produto: produtos.peloIndice(i)),
      ),
    );
  }
}
