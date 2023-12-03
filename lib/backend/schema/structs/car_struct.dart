// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarStruct extends FFFirebaseStruct {
  CarStruct({
    String? model,
    String? color,
    String? plate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _model = model,
        _color = color,
        _plate = plate,
        super(firestoreUtilData);

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  set model(String? val) => _model = val;
  bool hasModel() => _model != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "plate" field.
  String? _plate;
  String get plate => _plate ?? '';
  set plate(String? val) => _plate = val;
  bool hasPlate() => _plate != null;

  static CarStruct fromMap(Map<String, dynamic> data) => CarStruct(
        model: data['model'] as String?,
        color: data['color'] as String?,
        plate: data['plate'] as String?,
      );

  static CarStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CarStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'model': _model,
        'color': _color,
        'plate': _plate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'model': serializeParam(
          _model,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'plate': serializeParam(
          _plate,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarStruct fromSerializableMap(Map<String, dynamic> data) => CarStruct(
        model: deserializeParam(
          data['model'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        plate: deserializeParam(
          data['plate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarStruct &&
        model == other.model &&
        color == other.color &&
        plate == other.plate;
  }

  @override
  int get hashCode => const ListEquality().hash([model, color, plate]);
}

CarStruct createCarStruct({
  String? model,
  String? color,
  String? plate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CarStruct(
      model: model,
      color: color,
      plate: plate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CarStruct? updateCarStruct(
  CarStruct? car, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    car
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCarStructData(
  Map<String, dynamic> firestoreData,
  CarStruct? car,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (car == null) {
    return;
  }
  if (car.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && car.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final carData = getCarFirestoreData(car, forFieldValue);
  final nestedData = carData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = car.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCarFirestoreData(
  CarStruct? car, [
  bool forFieldValue = false,
]) {
  if (car == null) {
    return {};
  }
  final firestoreData = mapToFirestore(car.toMap());

  // Add any Firestore field values
  car.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCarListFirestoreData(
  List<CarStruct>? cars,
) =>
    cars?.map((e) => getCarFirestoreData(e, true)).toList() ?? [];
