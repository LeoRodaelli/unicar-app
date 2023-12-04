import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'create_ride_widget.dart' show CreateRideWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRideModel extends FlutterFlowModel<CreateRideWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePickerPart widget.
  var placePickerPartValue = FFPlace();
  // State field(s) for PlacePickerDest widget.
  var placePickerDestValue = FFPlace();
  // State field(s) for passageiroMax widget.
  FocusNode? passageiroMaxFocusNode;
  TextEditingController? passageiroMaxController;
  String? Function(BuildContext, String?)? passageiroMaxControllerValidator;
  // State field(s) for valorPorPassageiro widget.
  FocusNode? valorPorPassageiroFocusNode;
  TextEditingController? valorPorPassageiroController;
  String? Function(BuildContext, String?)?
      valorPorPassageiroControllerValidator;
  // State field(s) for LimitDeTempAddRoda widget.
  FocusNode? limitDeTempAddRodaFocusNode;
  TextEditingController? limitDeTempAddRodaController;
  String? Function(BuildContext, String?)?
      limitDeTempAddRodaControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (Cadastro da carona)] action in Button widget.
  ApiCallResponse? apiResultez0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    passageiroMaxFocusNode?.dispose();
    passageiroMaxController?.dispose();

    valorPorPassageiroFocusNode?.dispose();
    valorPorPassageiroController?.dispose();

    limitDeTempAddRodaFocusNode?.dispose();
    limitDeTempAddRodaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}