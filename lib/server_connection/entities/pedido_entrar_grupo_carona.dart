import 'package:unicar_maps/server_connection/entities/usuario.dart';

class PedidoEntrarNoGrupoDeCarona {
  final String idGrupo;
  final String parada;
  final Usuario usuario;

  const PedidoEntrarNoGrupoDeCarona({required this.idGrupo, required this.usuario, required this.parada});

  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoEntrarNoGrupoDeCarona",
      "data": {
        "usuario": usuario.toJSON(),
        "idGrupo": idGrupo,
        "parada": parada,
      },
    };
  }
}
