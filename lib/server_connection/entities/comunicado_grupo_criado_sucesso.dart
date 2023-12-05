import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';

class ComunicadoGrupoCriadoComSucesso {
  final GrupoCarona grupo;

  const ComunicadoGrupoCriadoComSucesso({
    required this.grupo,
  });

  factory ComunicadoGrupoCriadoComSucesso.fromJson(Map<String, dynamic> json) {
    return ComunicadoGrupoCriadoComSucesso(
      grupo: GrupoCarona.fromJson(json['grupoCarona']),
    );
  }
}
