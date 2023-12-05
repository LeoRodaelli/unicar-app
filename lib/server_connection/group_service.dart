import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_desligamento.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_criado_sucesso.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_inexistente.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_ja_existe.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_nenhum_grupo_vinculad.dart';
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
  Socket? socket;
  Stream? stream;
  static late ValueNotifier<String> notifier;

  GroupService(this.host, this.port);

  ValueNotifier<String> get streamNotifier => notifier;

  Future<void> init() async {
    try {
      if (socket != null) {
        return;
      }

      socket = await Socket.connect(host, port);

      notifier = ValueNotifier("{}");

      socket!.listen((event) {
        String stringJson = String.fromCharCodes(event);

        //verificar se por algum motivo há dois jsons seguidos na string,
        // se houver obter só o primeiro
        final index = stringJson.indexOf('}{');
        if (index != -1) {
          stringJson = stringJson.substring(0, index + 1);
        }

        notifier.value = stringJson;
        print('recebido no socket: ' + String.fromCharCodes(event));
        notifier.notifyListeners();
      });
    } catch (e) {
      print(e);
    }

    print('iniciou a conexao!');

    // socket!.listen(
    //   (event) {
    //     final comunicado = getComunicadoCorrespondente(
    //       jsonDecode(String.fromCharCodes(event)),
    //     );
    //     print('comunicado: ' + comunicado.toString());
    //   },
    // );
  }

  void listenToEvents(Function(dynamic comunicado) onDataReceived) async {
    try {
      notifier.addListener(
        () {
          print('onDataReceived: ' + onDataReceived.hashCode.toString());
          final comunicado = getComunicadoCorrespondente(
            jsonDecode(notifier.value),
          );

          print('comunicado: ' + comunicado.toString());
          onDataReceived(comunicado);
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void _sendData(String data) async {
    try {
      socket?.writeln(data);
      await socket?.flush();
    } catch (e) {
      print('send data error');
      print(e);
    }
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

  void joinRideGroup({
    required Usuario usuario,
    required String idGrupo,
  }) {
    _sendData(
      jsonEncode(
        PedidoEntrarNoGrupoDeCarona(idGrupo: idGrupo, usuario: usuario)
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
    print('get rides');
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
      case "ComunicadoTodosGuposDisponiveis":
        return ComunicadoTodosGuposDisponiveis.fromJson(json["data"]);
      case "ComunicadoNenhumGrupoVinculado":
        return ComunicadoNenhumGrupoVinculado.fromJson(json["data"]);
    }
  }

  void close() {
    socket?.close();
  }
}
