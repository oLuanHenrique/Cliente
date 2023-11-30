import 'package:flutter/material.dart';
import 'package:crud_app/models/produto.dart';

class ProdutoProvider with ChangeNotifier {
  Map<String, Produto> _produtos = {};

  ProdutoProvider() {
    // Adicione alguns produtos de exemplo
    adicionarProduto(
      Produto(
        id: '1',
        nome: 'Produto A',
        descricao: 'Descrição do Produto A',
        preco: 19.99,
        dataAtualizado: DateTime.now(),
      ),
    );

    adicionarProduto(
      Produto(
        id: '2',
        nome: 'Produto B',
        descricao: 'Descrição do Produto B',
        preco: 29.99,
        dataAtualizado: DateTime.now(),
      ),
    );

    adicionarProduto(
      Produto(
        id: '3',
        nome: 'Produto C',
        descricao: 'Descrição do Produto C',
        preco: 39.99,
        dataAtualizado: DateTime.now(),
      ),
    );

    // Adicione mais produtos se necessário
    // ...
  }

  Map<String, Produto> get produtos {
    return {..._produtos};
  }

  int get contador {
    return _produtos.length;
  }

  void adicionarProduto(Produto produto) {
    _produtos[produto.id] = produto;
    notifyListeners();
  }

  void removerProduto(String produtoId) {
    _produtos.remove(produtoId);
    notifyListeners();
  }

  void remove(String produtoId) {
    _produtos.remove(produtoId);
    notifyListeners();
  }

  Produto peloIndice(int index) {
    if (_produtos.isNotEmpty && index >= 0 && index < _produtos.length) {
      return _produtos.values.elementAt(index);
    } else {
      // Trate o índice fora dos limites ou _produtos vazio conforme necessário
      return Produto(
        id: '',
        nome: '',
        descricao: '',
        preco: 0.0,
        dataAtualizado: DateTime.now(),
      );
    }
  }
}
