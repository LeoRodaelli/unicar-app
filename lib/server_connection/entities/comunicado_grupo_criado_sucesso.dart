import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';

class ComunicadoGrupoCriadoComSucesso {
  final GrupoCarona grupoCarona;

  const ComunicadoGrupoCriadoComSucesso({
    required this.grupoCarona,
  });

  factory ComunicadoGrupoCriadoComSucesso.fromJson(Map<String, dynamic> json) {
    return ComunicadoGrupoCriadoComSucesso(
      grupoCarona: GrupoCarona.fromJson(json['grupoCarona']),
    );
  }
}
