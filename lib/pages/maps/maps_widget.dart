import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_model.dart';
export 'maps_model.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({
    Key? key,
    this.partida,
    this.destino,
  }) : super(key: key);

  final List<LatLng>? partida;
  final LatLng? destino;

  @override
  _MapsWidgetState createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  late MapsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.googleMapsController.future.then(
        (c) => c.animateCamera(
          CameraUpdate.newLatLng(widget.destino!.toGoogleMaps()),
        ),
      );
    });

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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              FutureBuilder<ApiCallResponse>(
                future: UnicarGroup.cadastroDaCaronaCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final googleMapCadastroDaCaronaResponse = snapshot.data!;
                  return FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        widget.destino!,
                    markers: (widget.partida ?? [])
                        .map(
                          (marker) => FlutterFlowMarker(
                            marker.serialize(),
                            marker,
                          ),
                        )
                        .toList(),
                    markerColor: GoogleMarkerColor.blue,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 14.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: false,
                    showLocation: true,
                    showCompass: true,
                    showMapToolbar: true,
                    showTraffic: false,
                    centerMapOnMarkerTap: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
