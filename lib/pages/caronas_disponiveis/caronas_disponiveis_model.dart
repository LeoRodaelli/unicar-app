import 'package:flutter/material.dart';

import '/components/ride_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aba_passageiro.dart' show AbaPassageiro;

class CaronasDisponiveisModel
    extends FlutterFlowModel<AbaPassageiro> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for RideWidget component.
  late RideWidgetModel rideWidgetModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rideWidgetModel = createModel(context, () => RideWidgetModel());
  }

  void dispose() {
    unfocusNode.dispose();
    rideWidgetModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
