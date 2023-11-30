import 'package:crud_app/models/produto.dart';
import 'package:crud_app/providers/produto_provider.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormulaireProduto extends StatefulWidget {
  const FormulaireProduto({Key? key}) : super(key: key);

  @override
  State<FormulaireProduto> createState() => _FormulaireProdutoState();
}

class _FormulaireProdutoState extends State<FormulaireProduto> {
  final _formulario = GlobalKey<FormState>();
  final Map<String, String> _dadosFormulario = {};

  // Método para carregar os dados do produto no formulário
  void _carregaDadosFormulario(Produto produto) {
    _dadosFormulario['id'] = produto.id;
    _dadosFormulario['nome'] = produto.nome;
    _dadosFormulario['descricao'] = produto.descricao;
    _dadosFormulario['preco'] = produto.preco.toString();
    _dadosFormulario['data_atualizado'] = produto.dataAtualizado.toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Object? produto = ModalRoute.of(context)!.settings.arguments;
    if (produto != null) {
      _carregaDadosFormulario(produto as Produto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Produtos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_formulario.currentState!.validate()) {
                _formulario.currentState!.save();
                Provider.of<ProdutoProvider>(context, listen: false).adicionarProduto(
                  Produto(
                    id: _dadosFormulario['id'] ?? '',
                    nome: _dadosFormulario['nome'] ?? '',
                    descricao: _dadosFormulario['descricao'] ?? '',
                    preco: double.parse(_dadosFormulario['preco'] ?? '0.0'),
                    dataAtualizado: DateTime.parse(_dadosFormulario['data_atualizado'] ?? ''),
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
                onSaved: (valor) => _dadosFormulario['id'] = valor!,
              ),
              TextFormField(
                initialValue: _dadosFormulario['nome'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Nome Inválido';
                  }
                  if (valor.trim().length < 3) {
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['nome'] = valor!,
              ),
              TextFormField(
                initialValue: _dadosFormulario['descricao'],
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Descrição é obrigatória';
                  }
                  if (valor.trim().length < 3 || valor.trim().length > 25) {
                    return 'A descrição deve ter entre 3 e 25 caracteres';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['descricao'] = valor!,
              ),
              TextFormField(
                initialValue: _dadosFormulario['preco'],
                decoration: const InputDecoration(labelText: 'Preço (em R\$)'),
                keyboardType: TextInputType.number,
                validator: (valor) {
                  if (valor == null || double.tryParse(valor) == null) {
                    return 'Preço inválido';
                  }
                  double preco = double.parse(valor);
                  if (preco <= 0 || preco >= 120) {
                    return 'O preço deve ser um número positivo menor que 120';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['preco'] = valor!,
              ),
              TextFormField(
                initialValue: _dadosFormulario['data_atualizado'],
                decoration: const InputDecoration(
                  labelText: 'Data Atualizado (Formato: yyyy-MM-dd HH:mm:ss)',
                ),
                keyboardType: TextInputType.datetime,
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Data é obrigatória';
                  }
                  try {
                    DateTime.parse(valor);
                  } catch (e) {
                    return 'Formato de data inválido';
                  }
                  return null;
                },
                onSaved: (valor) => _dadosFormulario['data_atualizado'] = valor!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
