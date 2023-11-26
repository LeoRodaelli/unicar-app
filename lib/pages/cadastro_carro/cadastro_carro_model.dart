import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'cadastro_carro_widget.dart' show CadastroCarroWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroCarroModel extends FlutterFlowModel<CadastroCarroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ModeloCarro widget.
  FocusNode? modeloCarroFocusNode;
  TextEditingController? modeloCarroController;
  String? Function(BuildContext, String?)? modeloCarroControllerValidator;
  // State field(s) for Cor widget.
  FocusNode? corFocusNode;
  TextEditingController? corController;
  String? Function(BuildContext, String?)? corControllerValidator;
  // State field(s) for Placa widget.
  FocusNode? placaFocusNode;
  TextEditingController? placaController;
  String? Function(BuildContext, String?)? placaControllerValidator;
  // State field(s) for CNHdocondutor widget.
  FocusNode? cNHdocondutorFocusNode;
  TextEditingController? cNHdocondutorController;
  String? Function(BuildContext, String?)? cNHdocondutorControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    modeloCarroFocusNode?.dispose();
    modeloCarroController?.dispose();

    corFocusNode?.dispose();
    corController?.dispose();

    placaFocusNode?.dispose();
    placaController?.dispose();

    cNHdocondutorFocusNode?.dispose();
    cNHdocondutorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
