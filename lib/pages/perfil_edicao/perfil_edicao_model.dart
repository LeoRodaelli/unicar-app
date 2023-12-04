import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'perfil_edicao_widget.dart' show PerfilEdicaoWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PerfilEdicaoModel extends FlutterFlowModel<PerfilEdicaoWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroController;
  String? Function(BuildContext, String?)? numeroControllerValidator;
  // State field(s) for universidade widget.
  FocusNode? universidadeFocusNode;
  TextEditingController? universidadeController;
  String? Function(BuildContext, String?)? universidadeControllerValidator;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeController;
  String? Function(BuildContext, String?)? idadeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    numeroFocusNode?.dispose();
    numeroController?.dispose();

    universidadeFocusNode?.dispose();
    universidadeController?.dispose();

    idadeFocusNode?.dispose();
    idadeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
