import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unicar_maps/components/ride_widget_widget.dart';
import 'package:unicar_maps/server_connection/entities/grupo_carona.dart';
import 'package:unicar_maps/server_connection/group_service.dart';

import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'caronas_disponiveis_model.dart';

class CaronasDisponiveis extends StatefulWidget {
  final List<GrupoCarona> gruposCarona;

  const CaronasDisponiveis({
    Key? key,
    required this.gruposCarona,
  }) : super(key: key);

  @override
  State<CaronasDisponiveis> createState() => _CaronasDisponiveisState();
}

class _CaronasDisponiveisState extends State<CaronasDisponiveis> {
  late CaronasDisponiveisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CaronasDisponiveisModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              itemCount: widget.gruposCarona.length,
              itemBuilder: (context, index) {
                final grupo = widget.gruposCarona[index];

                return CardCarona(
                  grupoCarona: grupo,
                  onTap: () {
                    GetIt.I
                        .get<GroupService>(instanceName: 'passageiro')
                        .joinRideGroup(
                            usuario: usuario, idGrupo: idGrupo, parada: parada);
                    Navigator.of(context)
                        .pushNamed('/carona', arguments: grupo);
                  },
                );
              }),
        ),
      ),
    );
  }
}

//card de carona

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              grupoCarona.motorista.nome,
              style: GoogleFonts.getFont(
                'Roboto',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              grupoCarona.localPartida,
              style: GoogleFonts.getFont(
                'Roboto',
                color: FlutterFlowTheme.of(context).secondaryBackground,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            Text(
              grupoCarona.preco.toString(),
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
    );
  }
}
