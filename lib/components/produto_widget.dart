import 'package:crud_app/models/produto.dart';
import 'package:crud_app/providers/produto_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoWidget extends StatelessWidget {
  final Produto produto;

  const ProdutoWidget({Key? key, required this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.shopping_cart),
      ),
      title: Text(produto.nome),
      subtitle: Text(produto.descricao),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.FORMULARIO_PRODUTO, arguments: produto);
              },
              icon: const Icon(Icons.edit),
              color: Colors.black,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Produto'),
                    content: const Text('Tem certeza?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Provider.of<ProdutoProvider>(context, listen: false)
                              .remove(produto.id);
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
