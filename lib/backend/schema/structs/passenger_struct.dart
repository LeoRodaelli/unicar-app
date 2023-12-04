// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassengerStruct extends FFFirebaseStruct {
  PassengerStruct({
    String? name,
    String? phone,
    LatLng? startingPlace,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _phone = phone,
        _startingPlace = startingPlace,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "startingPlace" field.
  LatLng? _startingPlace;
  LatLng? get startingPlace => _startingPlace;
  set startingPlace(LatLng? val) => _startingPlace = val;
  bool hasStartingPlace() => _startingPlace != null;

  static PassengerStruct fromMap(Map<String, dynamic> data) => PassengerStruct(
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        startingPlace: data['startingPlace'] as LatLng?,
      );

  static PassengerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PassengerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'phone': _phone,
        'startingPlace': _startingPlace,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'startingPlace': serializeParam(
          _startingPlace,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static PassengerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PassengerStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        startingPlace: deserializeParam(
          data['startingPlace'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'PassengerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PassengerStruct &&
        name == other.name &&
        phone == other.phone &&
        startingPlace == other.startingPlace;
  }

  @override
  int get hashCode => const ListEquality().hash([name, phone, startingPlace]);
}

PassengerStruct createPassengerStruct({
  String? name,
  String? phone,
  LatLng? startingPlace,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PassengerStruct(
      name: name,
      phone: phone,
      startingPlace: startingPlace,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PassengerStruct? updatePassengerStruct(
  PassengerStruct? passenger, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    passenger
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPassengerStructData(
  Map<String, dynamic> firestoreData,
  PassengerStruct? passenger,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (passenger == null) {
    return;
  }
  if (passenger.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && passenger.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final passengerData = getPassengerFirestoreData(passenger, forFieldValue);
  final nestedData = passengerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = passenger.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPassengerFirestoreData(
  PassengerStruct? passenger, [
  bool forFieldValue = false,
]) {
  if (passenger == null) {
    return {};
  }
  final firestoreData = mapToFirestore(passenger.toMap());

  // Add any Firestore field values
  passenger.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPassengerListFirestoreData(
  List<PassengerStruct>? passengers,
) =>
    passengers?.map((e) => getPassengerFirestoreData(e, true)).toList() ?? [];
