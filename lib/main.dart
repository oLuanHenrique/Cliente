import 'package:crud_app/providers/client_provider.dart';
import 'package:crud_app/providers/produto_provider.dart';
import 'package:crud_app/routes/routes.dart';
import 'package:crud_app/views/clients_list.dart';
import 'package:crud_app/views/formulaire.dart';
import 'package:crud_app/views/formulario-produto.dart';
import 'package:crud_app/views/home_screen.dart';  // Importe o novo arquivo
import 'package:crud_app/views/produtos_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        // Adicione outros provedores, se necessário
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProdutoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: Routes.INICIAL,
        routes: {
          Routes.INICIAL: (_) => const HomeScreen(),  // Alterado para exibir HomeScreen
          Routes.FORMULARIO_PRODUTO: (_) => const FormulaireProduto(),
          Routes.FORMULARIO:(_) => const Formulaire(),
          Routes.CLIENTES:(_) => const ClientsList(),
          Routes.PRODUTOS:(_) => const ProdutosList(),
        },
      ),
    );
  }
}

