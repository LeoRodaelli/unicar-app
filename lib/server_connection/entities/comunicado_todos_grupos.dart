import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';

class ComunicadoTodosGuposDisponiveis {
  final List<GrupoCarona> gruposCarona;

  const ComunicadoTodosGuposDisponiveis({
    required this.gruposCarona,
  });

  factory ComunicadoTodosGuposDisponiveis.fromJson(Map<String, dynamic> json) {
    final gruposCaronaJson = json['grupos'] as List<Map<String, dynamic>>;

    final gruposCarona = gruposCaronaJson
        .map(
          (grupoCarona) => GrupoCarona.fromJson(grupoCarona),
        )
        .toList();

    return ComunicadoTodosGuposDisponiveis(
      gruposCarona: gruposCarona,
    );
  }
}
