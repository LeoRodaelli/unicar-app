import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_carona_cancelada.dart';
import 'package:unicar_maps/server_connection/entities/comunicado_grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';
import 'package:unicar_maps/server_connection/entities/usuario.dart';
import 'package:unicar_maps/server_connection/group_service.dart';

import '/components/passeger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

export 'informacoes_carona_motorista_model.dart';

//EXIBE AS INFORMAÇÕES DA CARONA PARA O MOTORISTA

//GU: PRECISO AJUSTAR SERVIDOR PARA RETORNAR MEU GRUPO CARONA COM OS DADOS DOS USUARIOS NA CARONA

class InformacoesCaronaMotoristaWidget extends StatefulWidget {
  final GrupoCarona grupoCarona;

  InformacoesCaronaMotoristaWidget({
    Key? key,
    required this.grupoCarona,
  }) : super(key: key);

  @override
  _InformacoesCaronaMotoristaWidgetState createState() =>
      _InformacoesCaronaMotoristaWidgetState();
}

class _InformacoesCaronaMotoristaWidgetState
    extends State<InformacoesCaronaMotoristaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Usuario> passageiros = [];

  late final GroupService _groupService;

  @override
  void initState() {
    _groupService = GetIt.I.get<GroupService>();
    passageiros = widget.grupoCarona.passageiros;

    _groupService.streamNotifier.addListener(
      () {
        final comunicado = _groupService.getComunicadoCorrespondente(
          jsonDecode(_groupService.streamNotifier.value),
        );

        print('ouvi comunciado: $comunicado');
        if (comunicado is ComunicadoGrupoCarona) {
          updatePassageiros(comunicado.usuarios);
        } else if (comunicado is ComunicadoCaronaCancelada) {
          Navigator.pop(context);
        }
      },
    );

    super.initState();
  }

  void updatePassageiros(List<Usuario> passageiros) {
    print('era para atualizar');

    setState(() {
      this.passageiros = passageiros;
    });
  }

  // ficar ouvindo carona e atualizando lista de usuarios

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
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Informações',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Fredoka One',
                        color: Color(0xFFF1C40F),
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Caronas para próxima saída',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'Vagas preenchidas: ',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF818181),
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    passageiros.length.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 2.0, 2.0),
                    child: Text(
                      'Viagem programada para saída até',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF818181),
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                  child: Text(
                    widget.grupoCarona.horarioSaida,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: passageiros.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: PassegerWidget(
                      pass: passageiros[index],
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: FFButtonWidget(
                  onPressed: () async {
                    _groupService.leaveRideGroup();
                  },
                  text: 'Cancelar',
                  options: FFButtonOptions(
                    width: 350.0,
                    height: 44.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            // GU - removi pois nem estamos levando para o maps
            // Expanded(
            //   child: Align(
            //     alignment: AlignmentDirectional(0.00, -1.00),
            //     child: FFButtonWidget(
            //       onPressed: () async {
            //       },
            //       text: 'Iniciar',
            //       options: FFButtonOptions(
            //         width: 350.0,
            //         height: 44.0,
            //         padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            //         iconPadding:
            //             EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            //         color: Color(0xFFF1C40F),
            //         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
            //               fontFamily: 'Readex Pro',
            //               color: Colors.black,
            //               fontWeight: FontWeight.w800,
            //             ),
            //         elevation: 3.0,
            //         borderSide: BorderSide(
            //           color: Colors.transparent,
            //           width: 1.0,
            //         ),
            //         borderRadius: BorderRadius.circular(12.0),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
