import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicar_maps/auth/custom_auth/auth_util.dart';
import 'package:unicar_maps/index.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_inexistente.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_nenhum_grupo_vinculad.dart';
import 'package:unicar_maps/server_connection/group_service.dart';
import 'package:unicar_maps/server_connection/user_service.dart';

import '/backend/schema/structs/index.dart';
import '/components/ride_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AbaMotorista extends StatefulWidget {
  const AbaMotorista({super.key});

  @override
  State<AbaMotorista> createState() => _AbaMotoristaState();
}

class _AbaMotoristaState extends State<AbaMotorista> {
  late final GroupService _groupService;

  dynamic comunicado;

  @override
  void initState() {
    _groupService = GetIt.I.get<GroupService>(instanceName: 'motorista');

    _groupService.init().then(
      (_) {
        UserService().buscarDadosUsuario().then((user) {
          _groupService.recoverSession(
            idUsuario: user.id,
            categoria: 'motorista',
          );

          _groupService.listenToEvents((comunicado) {
            if (comunicado is ComunicadoMeuGrupoCarona ||
                comunicado is ComunicadoNenhumGrupoVinculado) {
              this.comunicado = comunicado;

              setState(() {});
            }
          });
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (comunicado is ComunicadoMeuGrupoCarona) {
      return InformacoesCaronaMotoristaWidget(
        grupoCarona: comunicado.grupoCarona,
      );
    } else if (comunicado is ComunicadoNenhumGrupoVinculado) {
      return const OferecerCaronaWidget();
    }

    return const CircularProgressIndicator();
  }
}
