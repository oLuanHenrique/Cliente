import 'package:crud_app/models/client.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientWidget extends StatelessWidget {
  final Client cliente;

  const ClientWidget({Key? key, required this.cliente}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = cliente.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(cliente.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text("${cliente.nome} ${cliente.sobrenome}"),
      subtitle: Text(cliente.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[

            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Routes.FORMULARIO, arguments: cliente);
              },
              icon: const Icon(Icons.edit),
              color: Colors.lightBlue,
            ),

            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Cliente'),
                    content: const Text('Tem certeza?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Provider.of<ClientProvider>(context, listen: false)
                              .remove(cliente.id);
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
