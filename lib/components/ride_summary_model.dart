import '/backend/schema/structs/index.dart';
import '/components/available_seats_widget.dart';
import '/components/passeger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'ride_summary_widget.dart' show RideSummaryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RideSummaryModel extends FlutterFlowModel<RideSummaryWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for AvailableSeats component.
  late AvailableSeatsModel availableSeatsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    availableSeatsModel = createModel(context, () => AvailableSeatsModel());
  }

  void dispose() {
    availableSeatsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
