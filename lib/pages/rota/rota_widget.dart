import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rota_model.dart';
export 'rota_model.dart';

class RotaWidget extends StatefulWidget {
  const RotaWidget({Key? key}) : super(key: key);

  @override
  _RotaWidgetState createState() => _RotaWidgetState();
}

class _RotaWidgetState extends State<RotaWidget> {
  late RotaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RotaModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 400.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: StreamBuilder<List<RotaRecord>>(
                                      stream: queryRotaRecord(
                                        queryBuilder: (rotaRecord) =>
                                            rotaRecord.where(
                                          'local',
                                          isEqualTo: _model.partidaValue.latLng
                                              ?.toGeoPoint(),
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RotaRecord> partidaRotaRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final partidaRotaRecord =
                                            partidaRotaRecordList.isNotEmpty
                                                ? partidaRotaRecordList.first
                                                : null;
                                        return FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          webGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          onSelect: (place) async {
                                            setState(() =>
                                                _model.partidaValue = place);
                                            (await _model.googleMapsController
                                                    .future)
                                                .animateCamera(
                                                    CameraUpdate.newLatLng(place
                                                        .latLng
                                                        .toGoogleMaps()));
                                          },
                                          defaultText:
                                              'Selecione Local de Partida',
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: 300.0,
                                            height: 40.0,
                                            color: Color(0xFFF1C40F),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 1.0),
                                    child: StreamBuilder<List<RotaRecord>>(
                                      stream: queryRotaRecord(
                                        queryBuilder: (rotaRecord) =>
                                            rotaRecord.where(
                                          'destino',
                                          isEqualTo: _model.detinoValue.latLng
                                              ?.toGeoPoint(),
                                        ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<RotaRecord> detinoRotaRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final detinoRotaRecord =
                                            detinoRotaRecordList.isNotEmpty
                                                ? detinoRotaRecordList.first
                                                : null;
                                        return FlutterFlowPlacePicker(
                                          iOSGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          androidGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          webGoogleMapsApiKey:
                                              'AIzaSyAET2ouvdSzvJ2_Ad0eKH8ZLWqH6ulUZb4',
                                          onSelect: (place) async {
                                            setState(() =>
                                                _model.detinoValue = place);
                                          },
                                          defaultText:
                                              'Selecione local de Destino',
                                          icon: Icon(
                                            Icons.place,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 16.0,
                                          ),
                                          buttonOptions: FFButtonOptions(
                                            width: 300.0,
                                            height: 40.0,
                                            color: Color(0xFFF1C40F),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                            elevation: 2.0,
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 10.0),
                                child: StreamBuilder<List<RotaRecord>>(
                                  stream: queryRotaRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<RotaRecord> iconButtonRotaRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final iconButtonRotaRecord =
                                        iconButtonRotaRecordList.isNotEmpty
                                            ? iconButtonRotaRecordList.first
                                            : null;
                                    return FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 60.0,
                                      fillColor: Colors.black,
                                      icon: Icon(
                                        Icons.search,
                                        color: Color(0xFFF1C40F),
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        final _googleMapMarker = _model.partidaValue.latLng;
                        return FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) =>
                              _model.googleMapsCenter = latLng,
                          initialLocation: _model.googleMapsCenter ??=
                              LatLng(-22.823632195397046, -47.04966932387979),
                          markers: [
                            if (_googleMapMarker != null)
                              FlutterFlowMarker(
                                _googleMapMarker.serialize(),
                                _googleMapMarker,
                              ),
                          ],
                          markerColor: GoogleMarkerColor.violet,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 10.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: false,
                          showMapToolbar: false,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
