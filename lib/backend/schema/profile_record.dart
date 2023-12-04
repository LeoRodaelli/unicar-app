import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileRecord extends FirestoreRecord {
  ProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ra" field.
  String? _ra;
  String get ra => _ra ?? '';
  bool hasRa() => _ra != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "ride" field.
  RideModelStruct? _ride;
  RideModelStruct get ride => _ride ?? RideModelStruct();
  bool hasRide() => _ride != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _ra = snapshotData['ra'] as String?;
    _phone = snapshotData['phone'] as String?;
    _email = snapshotData['email'] as String?;
    _ride = RideModelStruct.maybeFromMap(snapshotData['ride']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile');

  static Stream<ProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileRecord.fromSnapshot(s));

  static Future<ProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileRecord.fromSnapshot(s));

  static ProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileRecordData({
  String? name,
  String? ra,
  String? phone,
  String? email,
  RideModelStruct? ride,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'ra': ra,
      'phone': phone,
      'email': email,
      'ride': RideModelStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "ride" field.
  addRideModelStructData(firestoreData, ride, 'ride');

  return firestoreData;
}

class ProfileRecordDocumentEquality implements Equality<ProfileRecord> {
  const ProfileRecordDocumentEquality();

  @override
  bool equals(ProfileRecord? e1, ProfileRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.ra == e2?.ra &&
        e1?.phone == e2?.phone &&
        e1?.email == e2?.email &&
        e1?.ride == e2?.ride;
  }

  @override
  int hash(ProfileRecord? e) =>
      const ListEquality().hash([e?.name, e?.ra, e?.phone, e?.email, e?.ride]);

  @override
  bool isValidKey(Object? o) => o is ProfileRecord;
}
