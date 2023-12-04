class PedidoSairDoGrupoDeCarona {
  
    // dados a serem enviados precisam de toJSON() => PEDIDOS
    Map<String, dynamic> toJSON() {
      return {
        "type": "PedidoSairDoGrupoDeCarona",
        "data": {},
      };
    }
  }
  