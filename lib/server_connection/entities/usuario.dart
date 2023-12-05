import 'package:unicar_maps/server_connection/entities/carro.dart';

class Usuario {
  final String id;
  final String nome;
  final String contato;
  final Carro carro;
  final String? parada;

  const Usuario({
    required this.id,
    required this.nome,
    required this.contato,
    required this.carro,
    this.parada,
  });

  Usuario copyWith({
    String? id,
    String? nome,
    String? contato,
    Carro? carro,
    String? parada,
  }) {
    return Usuario(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      contato: contato ?? this.contato,
      carro: carro ?? this.carro,
      parada: parada ?? this.parada,
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "nome": nome,
      "contato": contato,
      "carro": carro.toJSON(),
      "parada": parada,
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    Carro carro;
    if (json["carro"] == null) {
      carro = const Carro(
        modelo: "",
        placa: "",
        cor: "",
      );
    } else {
      carro = Carro.fromJson(json["carro"]);
    }

    return Usuario(
      id: json["id"],
      nome: json["nome"],
      contato: json["contato"],
      carro: carro,
      parada: json["parada"],
    );
  }
}
