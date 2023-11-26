import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'data_model.dart';
export 'data_model.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({
    Key? key,
    this.da,
  }) : super(key: key);

  final DateTime? da;

  @override
  _DataWidgetState createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  late DataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 379.0,
      height: 447.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Visibility(
        visible: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ),
        child: FlutterFlowCalendar(
          color: Color(0xFFF1C40F),
          iconColor: FlutterFlowTheme.of(context).secondaryText,
          weekFormat: false,
          weekStartsMonday: false,
          rowHeight: 64.0,
          onChange: (DateTimeRange? newSelectedDate) async {
            _model.calendarSelectedDay = newSelectedDate;
            final _datePickedDate = await showDatePicker(
              context: context,
              initialDate: getCurrentTimestamp,
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
            );

            if (_datePickedDate != null) {
              safeSetState(() {
                _model.datePicked = DateTime(
                  _datePickedDate.year,
                  _datePickedDate.month,
                  _datePickedDate.day,
                );
              });
            }
            setState(() {});
          },
          titleStyle: FlutterFlowTheme.of(context).headlineSmall,
          dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
          dateStyle: FlutterFlowTheme.of(context).bodyMedium,
          selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
          inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
        ),
      ),
    );
  }
}
