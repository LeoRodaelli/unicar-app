import '/backend/schema/structs/index.dart';
import '/components/available_seats_widget.dart';
import '/components/passeger_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ride_summary_model.dart';
export 'ride_summary_model.dart';

class RideSummaryWidget extends StatefulWidget {
  const RideSummaryWidget({
    Key? key,
    required this.ride,
  }) : super(key: key);

  final RideStruct? ride;

  @override
  _RideSummaryWidgetState createState() => _RideSummaryWidgetState();
}

class _RideSummaryWidgetState extends State<RideSummaryWidget> {
  late RideSummaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RideSummaryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Text(
              'Informações',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Fredoka One',
                    color: Color(0xFFF1C40F),
                    fontSize: 32.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
            child: Text(
              'Caronas para próxima saída',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                child: Text(
                  'Vagas preenchidas: ',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF818181),
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            wrapWithModel(
              model: _model.availableSeatsModel,
              updateCallback: () => setState(() {}),
              child: AvailableSeatsWidget(
                available: valueOrDefault<int>(
                  widget.ride?.passengers?.length,
                  0,
                ),
                total: widget.ride!.maximumSeats,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 2.0, 2.0),
                child: Text(
                  'Viagem programada para saída até',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF818181),
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: Text(
                dateTimeFormat('d/M H:mm', widget.ride!.departureDateTime!),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ],
        ),
        Builder(
          builder: (context) {
            final passengers = widget.ride?.passengers?.toList() ?? [];
            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: passengers.length,
              itemBuilder: (context, passengersIndex) {
                final passengersItem = passengers[passengersIndex];
                return PassegerWidget(
                  key: Key('Key53k_${passengersIndex}_of_${passengers.length}'),
                  name: passengersItem.name,
                  phone: passengersItem.phone,
                  departurePlace: passengersItem.startingPlace!,
                );
              },
            );
          },
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.00, 1.00),
            child: FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: 'Cancelar',
              options: FFButtonOptions(
                width: 350.0,
                height: 44.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('maps');
              },
              text: 'Iniciar',
              options: FFButtonOptions(
                width: 350.0,
                height: 44.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Color(0xFFF1C40F),
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
