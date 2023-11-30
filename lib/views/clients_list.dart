// clients_list.dart

import 'package:crud_app/components/client_widget.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientsList extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ClientsList({Key? key});
  
  @override
  Widget build(BuildContext context) {
    final ClientProvider clientes = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text('Lista de clientes'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.FORMULARIO);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: clientes.contador,
        itemBuilder: (ctx, i) => ClientWidget(cliente: clientes.peloIndice(i)),
      ),
    );
  }
}
