import 'package:unicar_maps/server_connection/entities/usuario.dart';

class PedidoEntrarNoGrupoDeCarona {
  final String idGrupo;

  final Usuario usuario;

  const PedidoEntrarNoGrupoDeCarona(
      {required this.idGrupo, required this.usuario});

  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoEntrarNoGrupoDeCarona",
      "data": {
        "usuario": usuario.toJSON(),
        "idGrupo": idGrupo,
      },
    };
  }
}
