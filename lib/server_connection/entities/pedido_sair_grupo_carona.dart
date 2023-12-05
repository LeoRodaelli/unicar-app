class PedidoSairDoGrupoDeCarona {
  String idUsuario;
  String idGrupo;

  PedidoSairDoGrupoDeCarona({
    required this.idUsuario,
    required this.idGrupo,
  });

  // dados a serem enviados precisam de toJSON() => PEDIDOS
  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoSairDoGrupoDeCarona",
      "data": {
        "idUsuario": idUsuario,
        "idGrupo": idGrupo,
      },
    };
  }
}
