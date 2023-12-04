import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/create_ride_widget.dart';
import '/components/ride_summary_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'oferecer_carona_model.dart';
export 'oferecer_carona_model.dart';

class OferecerCaronaWidget extends StatefulWidget {
  const OferecerCaronaWidget({Key? key}) : super(key: key);

  @override
  _OferecerCaronaWidgetState createState() => _OferecerCaronaWidgetState();
}

class _OferecerCaronaWidgetState extends State<OferecerCaronaWidget> {
  late OferecerCaronaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OferecerCaronaModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: UnicarGroup.buscarDadosDeCaronaCall.call(
        authToken: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final oferecerCaronaBuscarDadosDeCaronaResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (!oferecerCaronaBuscarDadosDeCaronaResponse.succeeded)
                    wrapWithModel(
                      model: _model.createRideModel,
                      updateCallback: () => setState(() {}),
                      child: CreateRideWidget(),
                    ),
                  if (oferecerCaronaBuscarDadosDeCaronaResponse.succeeded)
                    wrapWithModel(
                      model: _model.rideSummaryModel,
                      updateCallback: () => setState(() {}),
                      child: RideSummaryWidget(
                        ride: RideStruct.fromMap(
                            oferecerCaronaBuscarDadosDeCaronaResponse.jsonBody),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
