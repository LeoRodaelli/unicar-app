import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';

class PedidoCriarGrupoDeCarona {
  final GrupoCarona grupoCarona;

  const PedidoCriarGrupoDeCarona({
    required this.grupoCarona
  });

  // dados a serem enviados precisam de toJSON() => PEDIDOS
  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoCriarGrupoDeCarona",
      "data": {
        "grupoCarona": grupoCarona.toJSON(),
      },
    };
  }
}
