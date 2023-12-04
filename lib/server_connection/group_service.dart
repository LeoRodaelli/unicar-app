import 'dart:convert';
import 'dart:io';

import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_desligamento.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_criado_sucesso.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_inexistente.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_ja_existe.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_saida.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_todos_grupos.dart';
import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/pedido_criar_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/pedido_entrar_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/pedido_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/pedido_sair_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/pedido_todos_grupos_disponiveis.dart';
import 'package:unicar_maps/server_connection/entities/usuario.dart';

class GroupService {
  final String host;
  final int port;
  late final Socket? socket;

  GroupService(this.host, this.port);

  Future<void> init() async {
    socket = await Socket.connect(host, port);
  }

  void listenToEvents(Function(dynamic comunicado) onDataReceived) {
    socket?.listen(
      (event) {
        final comunicado = getComunicadoCorrespondente(
          jsonDecode(String.fromCharCodes(event)),
        );

        onDataReceived(comunicado);
      },
    );
  }

  void _sendData(String data) async {
    socket?.writeln(data);
    await socket?.flush();
  }

  void createRideGroup(GrupoCarona grupoCarona) {
    try {
      _sendData(
        jsonEncode(
          PedidoCriarGrupoDeCarona(grupoCarona: grupoCarona).toJSON(),
        ),
      );
    } catch (_) {}
  }

  void joinRideGroup(
      {required Usuario usuario,
      required String idGrupo,
      required String parada}) {
    _sendData(
      jsonEncode(
        PedidoEntrarNoGrupoDeCarona(
                idGrupo: idGrupo, usuario: usuario, parada: parada)
            .toJSON(),
      ),
    );
  }

  void recoverSession({required String idUsuario, required String categoria}) {
    _sendData(
      jsonEncode(
        PedidoMeuGrupoCarona(
          idUsuario: idUsuario,
          categoria: categoria,
        ).toJSON(),
      ),
    );
  }

  void getAllRides({required String idUsuario}) {
    _sendData(
      jsonEncode(
        PedidoTodosGruposDisponiveis(idUsuario: idUsuario).toJSON(),
      ),
    );
  }

  void leaveRideGroup() {
    _sendData(
      jsonEncode(
        PedidoSairDoGrupoDeCarona().toJSON(),
      ),
    );
  }

  getComunicadoCorrespondente(Map<String, dynamic> json) {
    switch (json['type']) {
      case "ComunicadoGrupoJaExiste":
        return ComunicadoGrupoJaExiste.fromJson(json["data"]);
      case "ComunicadoGrupoInexistente":
        return ComunicadoGrupoInexistente.fromJson(json["data"]);
      case "ComunicadoGrupoDeCarona":
        return ComunicadoGrupoCarona.fromJson(json["data"]);
      case "ComunicadoDeDesligamento":
        return ComunicadoDeDesligamento.fromJson(json["data"]);
      case "ComunicadoSaida":
        return ComunicadoSaida.fromJson(json["data"]);
      case "ComunicadoCaronaCancelada":
        return ComunicadoCaronaCancelada.fromJson(json["data"]);
      case "ComunicadoGrupoCriadoComSucesso":
        return ComunicadoGrupoCriadoComSucesso.fromJson(json["data"]);
      case "ComunicadoMeuGrupoCarona":
        return ComunicadoMeuGrupoCarona.fromJson(json["data"]);
      case "ComunicadoTodosGruposDisponiveis":
        return ComunicadoTodosGuposDisponiveis.fromJson(json["data"]);
    }
  }

  void close() {
    socket?.close();
  }
}
