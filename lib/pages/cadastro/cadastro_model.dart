import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
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
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  // Stores action output result for [Backend Call - API (Cadastro de usuario)] action in Button widget.
  ApiCallResponse? apiResulti00;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    nomeFocusNode?.dispose();
    nomeController?.dispose();

    registroAcademicoRAFocusNode?.dispose();
    registroAcademicoRAController?.dispose();

    numeroDeContatoFocusNode?.dispose();
    numeroDeContatoController?.dispose();

    emailUniversitarioFocusNode?.dispose();
    emailUniversitarioController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
