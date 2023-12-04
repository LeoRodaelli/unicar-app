import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
import 'caronas_disponiveis_model.dart';

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
        //GU - EMAILc- TODO: PASSAR O EMAIL como id

        UserService().buscarDadosUsuario(token).then((user) {
          _groupService.recoverSession(
            idUsuario: user.id,
            categoria: 'passageiro',
          );

          _groupService.listenToEvents((comunicado) {
            if (comunicado is ComunicadoMeuGrupoCarona ||
                comunicado is ComunicadoNenhumGrupoVinculado ||
                comunicado is ComunicadoCaronaCancelada) {
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
      return InformacoesCaronaPassageiroWidget(
        grupoCarona: comunicado.grupoCarona,
      );

      //GU - TODO: adicionar no servidor
    } else if (comunicado is ComunicadoNenhumGrupoVinculado) {
      return const RotaWidget();
    }

    return const CircularProgressIndicator();
  }
}
