import 'dart:convert';
import 'dart:io';

import 'package:unicar_maps/server_connection/entities/usuario.dart';

class UserService {
  final HttpClient _httpClient = HttpClient();

  Future<Usuario> buscarDadosUsuario(String token) async {
    final uri = Uri.parse('http://127.0.0.1:4567/profile');
    
    final request = await _httpClient.getUrl(uri);
    request.headers.add('Authorization', 'Bearer $token');
    
    final response = await request.close();
    final responseBody = await response.transform(utf8.decoder).join();
    
    if (response.statusCode == HttpStatus.ok) {
      final jsonMap = json.decode(responseBody);
      final jsonUsuario = {
        'id': jsonMap['email'],
        'nome': jsonMap['anem'],
        'contato': jsonMap['phone'],
      };
      return Usuario.fromJson(jsonUsuario);
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}
