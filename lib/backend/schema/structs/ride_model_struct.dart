// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RideModelStruct extends FFFirebaseStruct {
  RideModelStruct({
    String? rider,
    String? exitPlace,
    DateTime? exitTime,
    DateTime? arriveDate,
    int? seats,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rider = rider,
        _exitPlace = exitPlace,
        _exitTime = exitTime,
        _arriveDate = arriveDate,
        _seats = seats,
        _price = price,
        super(firestoreUtilData);

  // "rider" field.
  String? _rider;
  String get rider => _rider ?? '';
  set rider(String? val) => _rider = val;
  bool hasRider() => _rider != null;

  // "exitPlace" field.
  String? _exitPlace;
  String get exitPlace => _exitPlace ?? '';
  set exitPlace(String? val) => _exitPlace = val;
  bool hasExitPlace() => _exitPlace != null;

  // "exitTime" field.
  DateTime? _exitTime;
  DateTime? get exitTime => _exitTime;
  set exitTime(DateTime? val) => _exitTime = val;
  bool hasExitTime() => _exitTime != null;

  // "arriveDate" field.
  DateTime? _arriveDate;
  DateTime? get arriveDate => _arriveDate;
  set arriveDate(DateTime? val) => _arriveDate = val;
  bool hasArriveDate() => _arriveDate != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  set seats(int? val) => _seats = val;
  void incrementSeats(int amount) => _seats = seats + amount;
  bool hasSeats() => _seats != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static RideModelStruct fromMap(Map<String, dynamic> data) => RideModelStruct(
        rider: data['rider'] as String?,
        exitPlace: data['exitPlace'] as String?,
        exitTime: data['exitTime'] as DateTime?,
        arriveDate: data['arriveDate'] as DateTime?,
        seats: castToType<int>(data['seats']),
        price: castToType<double>(data['price']),
      );

  static RideModelStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RideModelStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'rider': _rider,
        'exitPlace': _exitPlace,
        'exitTime': _exitTime,
        'arriveDate': _arriveDate,
        'seats': _seats,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rider': serializeParam(
          _rider,
          ParamType.String,
        ),
        'exitPlace': serializeParam(
          _exitPlace,
          ParamType.String,
        ),
        'exitTime': serializeParam(
          _exitTime,
          ParamType.DateTime,
        ),
        'arriveDate': serializeParam(
          _arriveDate,
          ParamType.DateTime,
        ),
        'seats': serializeParam(
          _seats,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static RideModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      RideModelStruct(
        rider: deserializeParam(
          data['rider'],
          ParamType.String,
          false,
        ),
        exitPlace: deserializeParam(
          data['exitPlace'],
          ParamType.String,
          false,
        ),
        exitTime: deserializeParam(
          data['exitTime'],
          ParamType.DateTime,
          false,
        ),
        arriveDate: deserializeParam(
          data['arriveDate'],
          ParamType.DateTime,
          false,
        ),
        seats: deserializeParam(
          data['seats'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RideModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RideModelStruct &&
        rider == other.rider &&
        exitPlace == other.exitPlace &&
        exitTime == other.exitTime &&
        arriveDate == other.arriveDate &&
        seats == other.seats &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([rider, exitPlace, exitTime, arriveDate, seats, price]);
}

RideModelStruct createRideModelStruct({
  String? rider,
  String? exitPlace,
  DateTime? exitTime,
  DateTime? arriveDate,
  int? seats,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RideModelStruct(
      rider: rider,
      exitPlace: exitPlace,
      exitTime: exitTime,
      arriveDate: arriveDate,
      seats: seats,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RideModelStruct? updateRideModelStruct(
  RideModelStruct? rideModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    rideModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRideModelStructData(
  Map<String, dynamic> firestoreData,
  RideModelStruct? rideModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (rideModel == null) {
    return;
  }
  if (rideModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && rideModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final rideModelData = getRideModelFirestoreData(rideModel, forFieldValue);
  final nestedData = rideModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = rideModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRideModelFirestoreData(
  RideModelStruct? rideModel, [
  bool forFieldValue = false,
]) {
  if (rideModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(rideModel.toMap());

  // Add any Firestore field values
  rideModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRideModelListFirestoreData(
  List<RideModelStruct>? rideModels,
) =>
    rideModels?.map((e) => getRideModelFirestoreData(e, true)).toList() ?? [];
