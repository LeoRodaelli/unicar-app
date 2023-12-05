import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unicar_maps/auth/custom_auth/auth_util.dart';
import 'package:unicar_maps/server_connection/entities/usuario.dart';

class UserService {
  final Dio _httpClient = Dio();

  static Usuario? _usuarioCache;

  Future<Usuario> buscarDadosUsuario({bool ignoreCache = false}) async {
    if (_usuarioCache != null && !ignoreCache) {
      return _usuarioCache!;
    }

    try {
      final request = await _httpClient.get(
        'http://127.0.0.1:4567/profile',
        options: Options(
          headers: {
            'Authorization': currentAuthenticationToken,
          },
        ),
      );

      print(request.data);

      final jsonMap = jsonDecode(request.data);
      final jsonUsuario = {
        'id': jsonMap['email'],
        'nome': jsonMap['name'],
        'contato': jsonMap['phone'],
      };
      _usuarioCache = Usuario.fromJson(jsonUsuario);
      return _usuarioCache!;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
