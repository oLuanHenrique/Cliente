import 'package:flutter/material.dart';
import 'package:crud_app/data/standard_client.dart';
import 'package:crud_app/models/client.dart';

class ClientProvider with ChangeNotifier {
  Map<String, Client> _clientes = {};

  ClientProvider() {
    // Adicione clientes padrão se a lista estiver vazia
    if (_clientes.isEmpty) {
      _clientes.addAll(STANDARD_CLIENTS);
    }
  }

  int get contador => _clientes.length;

  void put(Client cliente) {
    _clientes[cliente.id] = cliente;
    notifyListeners();
  }

  void remove(String id) {
    _clientes.remove(id);
    notifyListeners();
  }

  Client peloIndice(int i) {
    if (_clientes.isNotEmpty && i >= 0 && i < _clientes.length) {
      return _clientes.values.elementAt(i);
    } else {
      return const Client(
        id: '',
        nome: '',
        sobrenome: '',
        email: '',
        avatarUrl: '',
        idade: '',
      );
    }
  }
}
