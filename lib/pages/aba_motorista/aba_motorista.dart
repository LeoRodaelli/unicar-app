import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicar_maps/index.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_criado_sucesso.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_nenhum_grupo_vinculad.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_saida.dart';
import 'package:unicar_maps/server_connection/group_service.dart';
import 'package:unicar_maps/server_connection/user_service.dart';

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
    _groupService = GetIt.I.get<GroupService>();

    _groupService.init().then(
      (_) {
        UserService().buscarDadosUsuario().then((user) {
          _groupService.listenToEvents((comunicado) {
            if (comunicado is ComunicadoMeuGrupoCarona ||
                comunicado is ComunicadoNenhumGrupoVinculado ||
                comunicado is ComunicadoCaronaCancelada ||
                comunicado is ComunicadoGrupoCriadoComSucesso ||
                comunicado is ComunicadoSaida) {
              this.comunicado = comunicado;

              print('ABA MOTORISTA: $comunicado');

// check if widget is disposed
              if (mounted) {
                setState(() {});
              }
            }
          });
          _groupService.recoverSession(
            idUsuario: user.id,
            categoria: 'motorista',
          );
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (comunicado is ComunicadoMeuGrupoCarona ||
        comunicado is ComunicadoGrupoCriadoComSucesso) {
      return InformacoesCaronaMotoristaWidget(
        grupoCarona: comunicado.grupoCarona,
      );
    } else if (comunicado is ComunicadoNenhumGrupoVinculado ||
        comunicado is ComunicadoCaronaCancelada ||
        comunicado is ComunicadoSaida) {
      return const OferecerCaronaWidget();
    }

    return const CircularProgressIndicator();
  }

  @override
  void dispose() {
    //_groupService.close();
    super.dispose();
  }
}
