

import 'package:unicar_maps/server_connection/entities/usuario.dart';

class ComunicadoGrupoCarona {
  final List<Usuario> usuarios;
  final String idGrupo;

  const ComunicadoGrupoCarona({
    required this.idGrupo,
    this.usuarios = const <Usuario>[],
  });

  factory ComunicadoGrupoCarona.fromJson(Map<String, dynamic> json) {
    final usersJson = json['usuarios'] as List;

    final users = usersJson
        .map(
          (user) => Usuario.fromJson(user),
        )
        .toList();

    return ComunicadoGrupoCarona(
      idGrupo: json['idGrupo'],
      usuarios: users,
    );
  }
}
