import 'dart:async';

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
    _groupService = GetIt.I.get<GroupService>();

    _groupService.init().then(
      (_) {
        print('iniciou com sucesso');
        UserService().buscarDadosUsuario().then((user) {
          _groupService.listenToEvents((comunicado) {
            print('comunicado:' + comunicado.toString());
            if (comunicado is ComunicadoMeuGrupoCarona ||
                comunicado is ComunicadoNenhumGrupoVinculado ||
                comunicado is ComunicadoCaronaCancelada) {
              this.comunicado = comunicado;
              if (mounted) {
                setState(() {});
              }
            }
          });

          _groupService.recoverSession(
            idUsuario: user.id,
            categoria: 'passageiro',
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

  @override
  void dispose() {
    //_groupService.close();
    super.dispose();
  }
}
