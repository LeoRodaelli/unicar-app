import 'package:unicar_maps/server_connection/entities/carro.dart';
import 'package:unicar_maps/server_connection/entities/usuario.dart';

class GrupoCarona {
  final String idCarona;
  final Usuario motorista;
  final String localPartida;
  final String horarioSaida;
  final String localDestino;
  final double preco;
  final int vagasTotais;
  final List<Usuario> passageiros;

  const GrupoCarona._({
    required this.idCarona,
    required this.motorista,
    required this.localPartida,
    required this.horarioSaida,
    required this.preco,
    required this.vagasTotais,
    required this.localDestino,
    this.passageiros = const <Usuario>[],
  });

  factory GrupoCarona({
    required String idCarona,
    required Usuario motorista,
    required String localPartida,
    required String horarioSaida,
    required double preco,
    required int vagasTotais,
    required String localDestino,
    List<Usuario> passageiros = const <Usuario>[],
  }) {
    return GrupoCarona._(
      idCarona: idCarona,
      motorista: motorista,
      localPartida: localPartida,
      horarioSaida: horarioSaida,
      preco: preco,
      vagasTotais: vagasTotais,
      localDestino: localDestino,
      passageiros: passageiros,
    );
  }

  Carro get carro => motorista.carro;

  Map<String, dynamic> toJSON() {
    return {
      "idCarona": idCarona,
      "motorista": motorista.toJSON(),
      "localPartida": localPartida,
      "horarioSaida": horarioSaida,
      "preco": preco,
      "vagasTotais": vagasTotais,
      "localDestino": localDestino,
    };
  }

  factory GrupoCarona.fromJson(Map<String, dynamic> json) {
    final usersJson = json['usuarios'] as List;

    final users = usersJson
        .map(
          (user) => Usuario.fromJson(user),
        )
        .toList();

    return GrupoCarona._(
      idCarona: json["idCarona"],
      motorista: Usuario.fromJson(json["motorista"]),
      localPartida: json["localPartida"],
      horarioSaida: json["horarioSaida"],
      preco: json["preco"] is int
          ? double.parse(json["preco"].toString())
          : json["preco"],
      vagasTotais: json["vagasTotais"] as int,
      localDestino: json["localDestino"],
      passageiros: users,
    );
  }
}
