import 'client.dart';
abstract class ClientDAO{
 salvar(Client cliente);
 Future<Map<String, Client>> remover(dynamic id);
 Future<Map<String, Client>> encontrar();
}