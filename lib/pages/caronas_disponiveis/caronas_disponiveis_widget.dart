import '/backend/schema/structs/index.dart';
import '/components/ride_widget_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'caronas_disponiveis_model.dart';
export 'caronas_disponiveis_model.dart';

class CaronasDisponiveisWidget extends StatefulWidget {
  const CaronasDisponiveisWidget({Key? key}) : super(key: key);

  @override
  _CaronasDisponiveisWidgetState createState() =>
      _CaronasDisponiveisWidgetState();
}

class _CaronasDisponiveisWidgetState extends State<CaronasDisponiveisWidget> {
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
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              wrapWithModel(
                model: _model.rideWidgetModel,
                updateCallback: () => setState(() {}),
                child: RideWidgetWidget(
                  ride: RideModelStruct(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
