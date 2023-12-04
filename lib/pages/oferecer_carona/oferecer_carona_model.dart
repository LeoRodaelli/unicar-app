import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/create_ride_widget.dart';
import '/components/ride_summary_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'oferecer_carona_widget.dart' show OferecerCaronaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OferecerCaronaModel extends FlutterFlowModel<OferecerCaronaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CreateRide component.
  late CreateRideModel createRideModel;
  // Model for RideSummary component.
  late RideSummaryModel rideSummaryModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createRideModel = createModel(context, () => CreateRideModel());
    rideSummaryModel = createModel(context, () => RideSummaryModel());
  }

  void dispose() {
    unfocusNode.dispose();
    createRideModel.dispose();
    rideSummaryModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
