class PedidoTodosGruposDisponiveis {
  final String idUsuario;

  const PedidoTodosGruposDisponiveis({
    required this.idUsuario,
  });

  Map<String, dynamic> toJSON() {
    return {
      "type": "PedidoTodosGruposDisponiveis",
      "data": {
        "idUsuario": idUsuario,
      },
    };
  }
}
