import '/componentes/data/data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'oferecer_carona_widget.dart' show OferecerCaronaWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OferecerCaronaModel extends FlutterFlowModel<OferecerCaronaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for registroAcademico_RA widget.
  FocusNode? registroAcademicoRAFocusNode;
  TextEditingController? registroAcademicoRAController;
  String? Function(BuildContext, String?)?
      registroAcademicoRAControllerValidator;
  // State field(s) for numeroDeContato widget.
  FocusNode? numeroDeContatoFocusNode;
  TextEditingController? numeroDeContatoController;
  String? Function(BuildContext, String?)? numeroDeContatoControllerValidator;
  // State field(s) for emailUniversitario widget.
  FocusNode? emailUniversitarioFocusNode;
  TextEditingController? emailUniversitarioController;
  String? Function(BuildContext, String?)?
      emailUniversitarioControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    registroAcademicoRAFocusNode?.dispose();
    registroAcademicoRAController?.dispose();

    numeroDeContatoFocusNode?.dispose();
    numeroDeContatoController?.dispose();

    emailUniversitarioFocusNode?.dispose();
    emailUniversitarioController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
