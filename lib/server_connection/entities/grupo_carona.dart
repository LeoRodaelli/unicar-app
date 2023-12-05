import 'package:unicar_maps/server_connection/entities/usuario.dart';

class GrupoCarona {
  final String idCarona;
  final Usuario motorista;
  final String localPartida;
  final String horarioSaida;
  final double preco;
  final int vagasTotais;

  const GrupoCarona({
    required this.idCarona,
    required this.motorista,
    required this.localPartida,
    required this.horarioSaida,
    required this.preco,
    required this.vagasTotais,
  });

  Map<String, dynamic> toJSON() {
    return {
      "idCarona": idCarona,
      "motorista": motorista.toJSON(),
      "localPartida": localPartida,
      "horarioSaida": horarioSaida,
      "preco": preco,
      "vagasTotais": vagasTotais,
    };
  }

  factory GrupoCarona.fromJson(Map<String, dynamic> json) {
    return GrupoCarona(
      idCarona: json["idCarona"],
      motorista: json["motorista"],
      localPartida: json["localPartida"],
      horarioSaida: json["horarioSaida"],
      preco: json["preco"],
      vagasTotais: json["vagasTotais"],
    );
  }
}
