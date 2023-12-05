import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';

class ComunicadoMeuGrupoCarona {
  final GrupoCarona grupoCarona;

  const ComunicadoMeuGrupoCarona({
    required this.grupoCarona
  });

  factory ComunicadoMeuGrupoCarona.fromJson(Map<String, dynamic> json) {
    return ComunicadoMeuGrupoCarona(
      grupoCarona: GrupoCarona.fromJson(json['grupoCarona']),
    );
  }
}