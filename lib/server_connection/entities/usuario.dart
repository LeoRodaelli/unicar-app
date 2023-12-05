class Usuario {
  final String id;
  final String nome;
  final String contato;

  const Usuario({required this.id, required this.nome, required this.contato});

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "nome": nome,
      "contato": contato,
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json["id"], nome: json["nome"], contato: json["contato"]);
  }
}
