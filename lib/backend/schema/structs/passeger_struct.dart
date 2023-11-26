// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassegerStruct extends FFFirebaseStruct {
  PassegerStruct({
    String? phone,
    String? name,
    String? stoped,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _phone = phone,
        _name = name,
        _stoped = stoped,
        super(firestoreUtilData);

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "stoped" field.
  String? _stoped;
  String get stoped => _stoped ?? '';
  set stoped(String? val) => _stoped = val;
  bool hasStoped() => _stoped != null;

  static PassegerStruct fromMap(Map<String, dynamic> data) => PassegerStruct(
        phone: data['Phone'] as String?,
        name: data['name'] as String?,
        stoped: data['stoped'] as String?,
      );

  static PassegerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PassegerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Phone': _phone,
        'name': _name,
        'stoped': _stoped,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'stoped': serializeParam(
          _stoped,
          ParamType.String,
        ),
      }.withoutNulls;

  static PassegerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PassegerStruct(
        phone: deserializeParam(
          data['Phone'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        stoped: deserializeParam(
          data['stoped'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PassegerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PassegerStruct &&
        phone == other.phone &&
        name == other.name &&
        stoped == other.stoped;
  }

  @override
  int get hashCode => const ListEquality().hash([phone, name, stoped]);
}

PassegerStruct createPassegerStruct({
  String? phone,
  String? name,
  String? stoped,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PassegerStruct(
      phone: phone,
      name: name,
      stoped: stoped,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PassegerStruct? updatePassegerStruct(
  PassegerStruct? passeger, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    passeger
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPassegerStructData(
  Map<String, dynamic> firestoreData,
  PassegerStruct? passeger,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (passeger == null) {
    return;
  }
  if (passeger.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && passeger.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final passegerData = getPassegerFirestoreData(passeger, forFieldValue);
  final nestedData = passegerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = passeger.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPassegerFirestoreData(
  PassegerStruct? passeger, [
  bool forFieldValue = false,
]) {
  if (passeger == null) {
    return {};
  }
  final firestoreData = mapToFirestore(passeger.toMap());

  // Add any Firestore field values
  passeger.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPassegerListFirestoreData(
  List<PassegerStruct>? passegers,
) =>
    passegers?.map((e) => getPassegerFirestoreData(e, true)).toList() ?? [];
