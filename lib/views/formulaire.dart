import 'package:crud_app/models/client.dart';
import 'package:crud_app/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Formulaire extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Formulaire({Key? key});

  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  final _formulario = GlobalKey<FormState>();
  final Map<String, String?> _dadosFormulario = {};

  void _carregaDadosFormulario(Client cliente) {
    _dadosFormulario['id'] = cliente.id;
    _dadosFormulario['nome'] = cliente.nome;
    _dadosFormulario['sobrenome'] = cliente.sobrenome;
    _dadosFormulario['email'] = cliente.email;
    _dadosFormulario['idade'] = cliente.idade;
    _dadosFormulario['avatarURL'] = cliente.avatarUrl;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Object? cliente = ModalRoute.of(context)!.settings.arguments;
    if (cliente != null) {
      _carregaDadosFormulario(cliente as Client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de clientes'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_formulario.currentState!.validate()) {
                _formulario.currentState!.save();
                Provider.of<ClientProvider>(context, listen: false).put(
                  Client(
                    id: _dadosFormulario['id'] ?? '',
                    nome: _dadosFormulario['nome'] ?? '',
                    sobrenome: _dadosFormulario['sobrenome'] ?? '',
                    email: _dadosFormulario['email'] ?? '',
                    idade: _dadosFormulario['idade'] ?? '',
                    avatarUrl: _dadosFormulario['avatarURL'] ?? '',
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formulario,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _dadosFormulario['id'],
                decoration: const InputDecoration(labelText: 'ID'),
                onSaved: (valor) => _dadosFormulario['id'] = valor,
              ),

              TextFormField(
                initialValue: _dadosFormulario['nome'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }
                  if (valor.trim().length < 3 || valor.trim().length > 25) {
                    return 'O nome deve ter entre 3 e 25 caracteres';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['nome'] = valor,
              ),

              TextFormField(
                initialValue: _dadosFormulario['sobrenome'],
                decoration: const InputDecoration(labelText: 'Sobrenome'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Sobrenome é obrigatório';
                  }
                  if (valor.trim().length < 3 || valor.trim().length > 25) {
                    return 'O sobrenome deve ter entre 3 e 25 caracteres';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['sobrenome'] = valor,
              ),

              TextFormField(
                initialValue: _dadosFormulario['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Email é obrigatório';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(valor)) {
                    return 'Email inválido';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['email'] = valor,
              ),

              TextFormField(
                initialValue: _dadosFormulario['idade'],
                decoration: const InputDecoration(labelText: 'Idade'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Idade é obrigatória';
                  }
                  int idade = int.tryParse(valor) ?? 0;
                  if (idade <= 0 || idade >= 120) {
                    return 'A idade deve ser um número positivo menor que 120';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['idade'] = valor,
              ),

              TextFormField(
                initialValue: _dadosFormulario['avatarURL'],
                decoration: const InputDecoration(labelText: 'URL Avatar (opcional)'),
                // Validador opcional para URL válida
                validator: (valor) {
                  if (valor != null && valor.isNotEmpty) {
                    // Se fornecido, verifica se a URL é válida
                    if (!Uri.parse(valor).isAbsolute) {
                      return 'Por favor, forneça uma URL válida';
                    }
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['avatarURL'] = valor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
