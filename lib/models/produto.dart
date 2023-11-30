import 'package:crud_app/models/client.dart';

class Produto {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final DateTime dataAtualizado;
  

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.dataAtualizado,
    
  });
}
