import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicar_maps/index.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_nenhum_grupo_vinculad.dart';
import 'package:unicar_maps/server_connection/group_service.dart';
import 'package:unicar_maps/server_connection/user_service.dart';

export 'caronas_disponiveis_model.dart';

class AbaPassageiro extends StatefulWidget {
  const AbaPassageiro({super.key});

  @override
  State<AbaPassageiro> createState() => _AbaPassageiroState();
}

class _AbaPassageiroState extends State<AbaPassageiro> {
  late final GroupService _groupService;

  dynamic comunicado;

  @override
  void initState() {
    _groupService = GetIt.I.get<GroupService>(instanceName: 'passageiro');

    _groupService.init().then(
      (_) {
        UserService().buscarDadosUsuario().then((user) {
          _groupService.recoverSession(
            idUsuario: user.id,
            categoria: 'passageiro',
          );

          _groupService.stream().listen(
            (event) {
              final comunicado = GroupService.getComunicadoCorrespondente(
                jsonDecode(String.fromCharCodes(event)),
              );

              if (comunicado is ComunicadoMeuGrupoCarona ||
                  comunicado is ComunicadoNenhumGrupoVinculado ||
                  comunicado is ComunicadoCaronaCancelada) {
                this.comunicado = comunicado;

                setState(() {});
              }
            },
          );
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (comunicado is ComunicadoMeuGrupoCarona) {
      return InformacoesCaronaPassageiroWidget(
        grupoCarona: comunicado.grupoCarona,
      );

      //GU - TODO: adicionar no servidor: ok
    } else if (comunicado is ComunicadoNenhumGrupoVinculado) {
      return const RotaWidget();
    }

    return const CircularProgressIndicator();
  }
}
