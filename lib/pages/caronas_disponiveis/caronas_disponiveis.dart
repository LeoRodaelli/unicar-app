import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicar_maps/pages/informacoes_carona_passageiro/informacoes_carona_passageiro_widget.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_todos_grupos.dart';
import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';
import 'package:unicar_maps/server_connection/group_service.dart';
import 'package:unicar_maps/server_connection/user_service.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'caronas_disponiveis_model.dart';

class CaronasDisponiveis extends StatefulWidget {
  const CaronasDisponiveis({
    Key? key,
  }) : super(key: key);

  @override
  State<CaronasDisponiveis> createState() => _CaronasDisponiveisState();
}

class _CaronasDisponiveisState extends State<CaronasDisponiveis> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<GrupoCarona> gruposCarona = [];

  late final GroupService _groupService;

  @override
  void initState() {
    super.initState();

    _groupService = GetIt.I.get<GroupService>();

    UserService().buscarDadosUsuario().then((user) {
      _groupService.streamNotifier.addListener(
        () {
          print('recebi carona: ${_groupService.streamNotifier.value}');
          final comunicado = _groupService.getComunicadoCorrespondente(
            jsonDecode(_groupService.streamNotifier.value),
          );

          if (comunicado is ComunicadoTodosGuposDisponiveis) {
            updateCaronas(comunicado.gruposCarona);
          }
        },
      );

      _groupService.getAllRides(idUsuario: user.id);
    });
  }

  void updateCaronas(List<GrupoCarona> caronas) {
    for (var carona in caronas) {
      print('carona: ${carona.toJSON()}');
    }
    if (mounted)
      setState(() {
        gruposCarona = caronas;
      });
  }


  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Caronas Disponiveis',
          style: GoogleFonts.getFont(
            'Fredoka One',
            color: Color(0xFFF1C40F),
            fontWeight: FontWeight.w500,
            fontSize: 32.0,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: ListView.builder(
            itemCount: gruposCarona.length,
            itemBuilder: (context, index) {
              final grupo = gruposCarona[index];

              return CardCarona(
                grupoCarona: grupo,
                onTap: () async {
                  final user = await UserService().buscarDadosUsuario();

                  GetIt.I.get<GroupService>().joinRideGroup(
                        usuario: user,
                        idGrupo: grupo.idCarona,
                      );

                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return InformacoesCaronaPassageiroWidget(
                            grupoCarona: grupo,
                          );
                        },
                      ),
                    );
                  }
                },
              );
            }),
      ),
    );
  }
}

class CardCarona extends StatelessWidget {
  final GrupoCarona grupoCarona;
  final VoidCallback onTap;

  const CardCarona({
    Key? key,
    required this.grupoCarona,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: FlutterFlowTheme.of(context).primary,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Motorista: ' + grupoCarona.motorista.nome,
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Sai de:' + grupoCarona.localPartida,
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                'Vai para:' + grupoCarona.localDestino,
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                'Horário de partida:' + grupoCarona.horarioSaida,
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              Text(
                'Preço: R\$' + grupoCarona.preco.toString(),
                style: GoogleFonts.getFont(
                  'Roboto',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
