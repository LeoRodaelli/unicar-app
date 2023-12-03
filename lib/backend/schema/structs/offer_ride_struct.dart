// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferRideStruct extends FFFirebaseStruct {
  OfferRideStruct({
    LatLng? startLocal,
    LatLng? exitLocal,
    String? numberPassenger,
    String? valorPay,
    DateTime? timeLimit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startLocal = startLocal,
        _exitLocal = exitLocal,
        _numberPassenger = numberPassenger,
        _valorPay = valorPay,
        _timeLimit = timeLimit,
        super(firestoreUtilData);

  // "startLocal" field.
  LatLng? _startLocal;
  LatLng? get startLocal => _startLocal;
  set startLocal(LatLng? val) => _startLocal = val;
  bool hasStartLocal() => _startLocal != null;

  // "exitLocal" field.
  LatLng? _exitLocal;
  LatLng? get exitLocal => _exitLocal;
  set exitLocal(LatLng? val) => _exitLocal = val;
  bool hasExitLocal() => _exitLocal != null;

  // "numberPassenger" field.
  String? _numberPassenger;
  String get numberPassenger => _numberPassenger ?? '';
  set numberPassenger(String? val) => _numberPassenger = val;
  bool hasNumberPassenger() => _numberPassenger != null;

  // "valorPay" field.
  String? _valorPay;
  String get valorPay => _valorPay ?? '';
  set valorPay(String? val) => _valorPay = val;
  bool hasValorPay() => _valorPay != null;

  // "timeLimit" field.
  DateTime? _timeLimit;
  DateTime? get timeLimit => _timeLimit;
  set timeLimit(DateTime? val) => _timeLimit = val;
  bool hasTimeLimit() => _timeLimit != null;

  static OfferRideStruct fromMap(Map<String, dynamic> data) => OfferRideStruct(
        startLocal: data['startLocal'] as LatLng?,
        exitLocal: data['exitLocal'] as LatLng?,
        numberPassenger: data['numberPassenger'] as String?,
        valorPay: data['valorPay'] as String?,
        timeLimit: data['timeLimit'] as DateTime?,
      );

  static OfferRideStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OfferRideStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'startLocal': _startLocal,
        'exitLocal': _exitLocal,
        'numberPassenger': _numberPassenger,
        'valorPay': _valorPay,
        'timeLimit': _timeLimit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startLocal': serializeParam(
          _startLocal,
          ParamType.LatLng,
        ),
        'exitLocal': serializeParam(
          _exitLocal,
          ParamType.LatLng,
        ),
        'numberPassenger': serializeParam(
          _numberPassenger,
          ParamType.String,
        ),
        'valorPay': serializeParam(
          _valorPay,
          ParamType.String,
        ),
        'timeLimit': serializeParam(
          _timeLimit,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static OfferRideStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfferRideStruct(
        startLocal: deserializeParam(
          data['startLocal'],
          ParamType.LatLng,
          false,
        ),
        exitLocal: deserializeParam(
          data['exitLocal'],
          ParamType.LatLng,
          false,
        ),
        numberPassenger: deserializeParam(
          data['numberPassenger'],
          ParamType.String,
          false,
        ),
        valorPay: deserializeParam(
          data['valorPay'],
          ParamType.String,
          false,
        ),
        timeLimit: deserializeParam(
          data['timeLimit'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'OfferRideStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfferRideStruct &&
        startLocal == other.startLocal &&
        exitLocal == other.exitLocal &&
        numberPassenger == other.numberPassenger &&
        valorPay == other.valorPay &&
        timeLimit == other.timeLimit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([startLocal, exitLocal, numberPassenger, valorPay, timeLimit]);
}

OfferRideStruct createOfferRideStruct({
  LatLng? startLocal,
  LatLng? exitLocal,
  String? numberPassenger,
  String? valorPay,
  DateTime? timeLimit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfferRideStruct(
      startLocal: startLocal,
      exitLocal: exitLocal,
      numberPassenger: numberPassenger,
      valorPay: valorPay,
      timeLimit: timeLimit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfferRideStruct? updateOfferRideStruct(
  OfferRideStruct? offerRide, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offerRide
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfferRideStructData(
  Map<String, dynamic> firestoreData,
  OfferRideStruct? offerRide,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offerRide == null) {
    return;
  }
  if (offerRide.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offerRide.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offerRideData = getOfferRideFirestoreData(offerRide, forFieldValue);
  final nestedData = offerRideData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offerRide.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfferRideFirestoreData(
  OfferRideStruct? offerRide, [
  bool forFieldValue = false,
]) {
  if (offerRide == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offerRide.toMap());

  // Add any Firestore field values
  offerRide.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfferRideListFirestoreData(
  List<OfferRideStruct>? offerRides,
) =>
    offerRides?.map((e) => getOfferRideFirestoreData(e, true)).toList() ?? [];
