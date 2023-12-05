import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/passeger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'informacoes_carona_motorista_widget.dart'
    show InformacoesCaronaMotoristaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InformacoesCaronaMotoristaModel
    extends FlutterFlowModel<InformacoesCaronaMotoristaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Passeger component.
  late PassegerModel passegerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passegerModel = createModel(context, () => PassegerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    passegerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
