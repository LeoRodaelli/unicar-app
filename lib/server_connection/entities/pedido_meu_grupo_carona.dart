

class PedidoMeuGrupoCarona {
  final String idUsuario;
  final String categoria;
  static const String motorista = "motorista";
  static const String passageiro = "passageiro";

  const PedidoMeuGrupoCarona({required this.idUsuario, required this.categoria});

  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoMeuGrupoCarona",
      "data": {
        "idUsuario": idUsuario,
        "categoria": categoria,
      },
    };
  }
}