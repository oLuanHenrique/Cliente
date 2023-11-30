import 'dart:convert';
import 'package:http/http.dart' as http;
import 'client.dart';
import 'client_dao.dart';
class ClientDAOMySQL implements ClientDAO {
  @override
 Future<Map<String, Client>> encontrar() async {
 var uri = Uri.parse('http://localhost:3000/clientes');
 var resposta = await http.get(uri);
 if (resposta.statusCode != 200) throw Exception("Erro REST API");
 Iterable lista = json.decode(resposta.body);
 var map = <String, Client>{};
 for (var item in lista) {
 map[item['id'].toString()] = Client(
 id: item['id'].toString(),
 nome: item['nome'],
 sobrenome: item['sobrenome'],
 email: item['email'],
 avatarUrl: item['avatarUrl'], idade: '');
 }
 return map;
 }

@override
 Future<Map<String, Client>> remover(id) async {
 var uri = Uri.parse('http://localhost:3000/clientes/$id');
 var resposta = await http.delete(uri);
 if (resposta.statusCode != 200) throw Exception("Erro REST API");
 return encontrar();
 }

@override
 salvar(Client cliente) async {
 var uri = Uri.parse('http://localhost:3000/clientes');
 final jsonText = jsonEncode(Client.toJson(cliente));
 if (cliente.id.trim().isEmpty) {
 var response = await http.post(uri,
 body: jsonText, headers: {"Content-Type": "application/json"});
 if (response.statusCode != 200) throw Exception("Erro REST API");
 } else {
 var response = await http.put(uri, body: jsonText, headers: {"Content-Type": "application/json"});
 if (response.statusCode != 200) throw Exception("Erro REST API");
 }
 }

}
