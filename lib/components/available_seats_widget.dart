import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'available_seats_model.dart';
export 'available_seats_model.dart';

class AvailableSeatsWidget extends StatefulWidget {
  const AvailableSeatsWidget({
    Key? key,
    required this.available,
    required this.total,
  }) : super(key: key);

  final int? available;
  final int? total;

  @override
  _AvailableSeatsWidgetState createState() => _AvailableSeatsWidgetState();
}

class _AvailableSeatsWidgetState extends State<AvailableSeatsWidget> {
  late AvailableSeatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvailableSeatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valueOrDefault<String>(
            widget.available?.toString(),
            '0',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
        Text(
          '/',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
        Text(
          valueOrDefault<String>(
            widget.total?.toString(),
            '0',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ],
    );
  }
}
