import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RotaRecord extends FirestoreRecord {
  RotaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_location" field.
  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  bool hasUserLocation() => _userLocation != null;

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "destination_location" field.
  LatLng? _destinationLocation;
  LatLng? get destinationLocation => _destinationLocation;
  bool hasDestinationLocation() => _destinationLocation != null;

  // "destination_address" field.
  String? _destinationAddress;
  String get destinationAddress => _destinationAddress ?? '';
  bool hasDestinationAddress() => _destinationAddress != null;

  // "user_address" field.
  String? _userAddress;
  String get userAddress => _userAddress ?? '';
  bool hasUserAddress() => _userAddress != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "is_driver_assined" field.
  bool? _isDriverAssined;
  bool get isDriverAssined => _isDriverAssined ?? false;
  bool hasIsDriverAssined() => _isDriverAssined != null;

  void _initializeFields() {
    _userLocation = snapshotData['user_location'] as LatLng?;
    _userUid = snapshotData['user_uid'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _destinationLocation = snapshotData['destination_location'] as LatLng?;
    _destinationAddress = snapshotData['destination_address'] as String?;
    _userAddress = snapshotData['user_address'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _isDriverAssined = snapshotData['is_driver_assined'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rota');

  static Stream<RotaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RotaRecord.fromSnapshot(s));

  static Future<RotaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RotaRecord.fromSnapshot(s));

  static RotaRecord fromSnapshot(DocumentSnapshot snapshot) => RotaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RotaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RotaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RotaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RotaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRotaRecordData({
  LatLng? userLocation,
  String? userUid,
  LatLng? driverLocation,
  String? driverUid,
  LatLng? destinationLocation,
  String? destinationAddress,
  String? userAddress,
  String? userName,
  String? driverName,
  bool? isDriverAssined,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_location': userLocation,
      'user_uid': userUid,
      'driver_location': driverLocation,
      'driver_uid': driverUid,
      'destination_location': destinationLocation,
      'destination_address': destinationAddress,
      'user_address': userAddress,
      'user_name': userName,
      'driver_name': driverName,
      'is_driver_assined': isDriverAssined,
    }.withoutNulls,
  );

  return firestoreData;
}

class RotaRecordDocumentEquality implements Equality<RotaRecord> {
  const RotaRecordDocumentEquality();

  @override
  bool equals(RotaRecord? e1, RotaRecord? e2) {
    return e1?.userLocation == e2?.userLocation &&
        e1?.userUid == e2?.userUid &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.driverUid == e2?.driverUid &&
        e1?.destinationLocation == e2?.destinationLocation &&
        e1?.destinationAddress == e2?.destinationAddress &&
        e1?.userAddress == e2?.userAddress &&
        e1?.userName == e2?.userName &&
        e1?.driverName == e2?.driverName &&
        e1?.isDriverAssined == e2?.isDriverAssined;
  }

  @override
  int hash(RotaRecord? e) => const ListEquality().hash([
        e?.userLocation,
        e?.userUid,
        e?.driverLocation,
        e?.driverUid,
        e?.destinationLocation,
        e?.destinationAddress,
        e?.userAddress,
        e?.userName,
        e?.driverName,
        e?.isDriverAssined
      ]);

  @override
  bool isValidKey(Object? o) => o is RotaRecord;
}
