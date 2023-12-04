// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideStruct extends FFFirebaseStruct {
  RideStruct({
    DateTime? departureDateTime,
    List<PassengerStruct>? passengers,
    int? maximumSeats,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _departureDateTime = departureDateTime,
        _passengers = passengers,
        _maximumSeats = maximumSeats,
        super(firestoreUtilData);

  // "departureDateTime" field.
  DateTime? _departureDateTime;
  DateTime? get departureDateTime => _departureDateTime;
  set departureDateTime(DateTime? val) => _departureDateTime = val;
  bool hasDepartureDateTime() => _departureDateTime != null;

  // "passengers" field.
  List<PassengerStruct>? _passengers;
  List<PassengerStruct> get passengers => _passengers ?? const [];
  set passengers(List<PassengerStruct>? val) => _passengers = val;
  void updatePassengers(Function(List<PassengerStruct>) updateFn) =>
      updateFn(_passengers ??= []);
  bool hasPassengers() => _passengers != null;

  // "maximumSeats" field.
  int? _maximumSeats;
  int get maximumSeats => _maximumSeats ?? 0;
  set maximumSeats(int? val) => _maximumSeats = val;
  void incrementMaximumSeats(int amount) =>
      _maximumSeats = maximumSeats + amount;
  bool hasMaximumSeats() => _maximumSeats != null;

  static RideStruct fromMap(Map<String, dynamic> data) => RideStruct(
        departureDateTime: data['departureDateTime'] as DateTime?,
        passengers: getStructList(
          data['passengers'],
          PassengerStruct.fromMap,
        ),
        maximumSeats: castToType<int>(data['maximumSeats']),
      );

  static RideStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RideStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'departureDateTime': _departureDateTime,
        'passengers': _passengers?.map((e) => e.toMap()).toList(),
        'maximumSeats': _maximumSeats,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'departureDateTime': serializeParam(
          _departureDateTime,
          ParamType.DateTime,
        ),
        'passengers': serializeParam(
          _passengers,
          ParamType.DataStruct,
          true,
        ),
        'maximumSeats': serializeParam(
          _maximumSeats,
          ParamType.int,
        ),
      }.withoutNulls;

  static RideStruct fromSerializableMap(Map<String, dynamic> data) =>
      RideStruct(
        departureDateTime: deserializeParam(
          data['departureDateTime'],
          ParamType.DateTime,
          false,
        ),
        passengers: deserializeStructParam<PassengerStruct>(
          data['passengers'],
          ParamType.DataStruct,
          true,
          structBuilder: PassengerStruct.fromSerializableMap,
        ),
        maximumSeats: deserializeParam(
          data['maximumSeats'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RideStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RideStruct &&
        departureDateTime == other.departureDateTime &&
        listEquality.equals(passengers, other.passengers) &&
        maximumSeats == other.maximumSeats;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([departureDateTime, passengers, maximumSeats]);
}

RideStruct createRideStruct({
  DateTime? departureDateTime,
  int? maximumSeats,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RideStruct(
      departureDateTime: departureDateTime,
      maximumSeats: maximumSeats,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RideStruct? updateRideStruct(
  RideStruct? ride, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ride
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRideStructData(
  Map<String, dynamic> firestoreData,
  RideStruct? ride,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ride == null) {
    return;
  }
  if (ride.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && ride.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rideData = getRideFirestoreData(ride, forFieldValue);
  final nestedData = rideData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ride.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRideFirestoreData(
  RideStruct? ride, [
  bool forFieldValue = false,
]) {
  if (ride == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ride.toMap());

  // Add any Firestore field values
  ride.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRideListFirestoreData(
  List<RideStruct>? rides,
) =>
    rides?.map((e) => getRideFirestoreData(e, true)).toList() ?? [];
