import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:unicar_maps/index.dart';
import 'package:unicar_maps/pages/caronas_disponiveis/caronas_disponiveis.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_meu_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_nenhum_grupo_vinculad.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_saida.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_todos_grupos.dart';
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
        UserService().buscarDadosUsuario().then((user) {
          _groupService.listenToEvents((comunicado) {
            if (comunicado is ComunicadoMeuGrupoCarona ||
                comunicado is ComunicadoNenhumGrupoVinculado ||
                comunicado is ComunicadoCaronaCancelada ||
                comunicado is ComunicadoTodosGuposDisponiveis || 
                comunicado is ComunicadoSaida) {
              this.comunicado = comunicado;

              reload();
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

  void reload() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (comunicado is ComunicadoMeuGrupoCarona) {
      return InformacoesCaronaPassageiroWidget(
        grupoCarona: comunicado.grupoCarona,
      );
    } else if (comunicado is ComunicadoNenhumGrupoVinculado ||
        comunicado is ComunicadoCaronaCancelada ||
        comunicado is ComunicadoSaida) {
      return const RotaWidget();
    } else if (comunicado is ComunicadoTodosGuposDisponiveis) {
      return CaronasDisponiveis(
        gruposCarona: comunicado.gruposCarona,
      );
    }

    return const CircularProgressIndicator();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
