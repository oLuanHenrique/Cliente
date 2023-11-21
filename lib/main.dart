import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:crud_app/views/clients_list.dart';
import 'package:crud_app/views/formulaire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => ClientProvider())],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
            useMaterial3: true,
          ),
          routes: {
            Routes.INICIAL: (_) => const ClientsList(),
            Routes.FORMULARIO: (_) => Formulaire()
            
          }),
    );
  }
}

//A tela de adicionar o Cliente e Lista de Clientes; No slide tem os 2 juntos na foto!
//Eles têm q estar juntos ou tem q ter um botão igual tem no que fizemos??
//O app abre inicialmente na pasta de clientes como faz pra mudar pra um com 2 botões que direciona p/ outras??
//Para criar a do Produto e lista Produto, eh so copiar a dos clientes e modificar?? 
//E o Id como fica na pasta do cliente??