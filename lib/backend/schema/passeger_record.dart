import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassegerRecord extends FirestoreRecord {
  PassegerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "stoper" field.
  String? _stoper;
  String get stoper => _stoper ?? '';
  bool hasStoper() => _stoper != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _phone = snapshotData['phone'] as String?;
    _stoper = snapshotData['stoper'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passeger');

  static Stream<PassegerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassegerRecord.fromSnapshot(s));

  static Future<PassegerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassegerRecord.fromSnapshot(s));

  static PassegerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassegerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassegerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassegerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassegerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassegerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassegerRecordData({
  String? name,
  String? phone,
  String? stoper,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'phone': phone,
      'stoper': stoper,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassegerRecordDocumentEquality implements Equality<PassegerRecord> {
  const PassegerRecordDocumentEquality();

  @override
  bool equals(PassegerRecord? e1, PassegerRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.phone == e2?.phone &&
        e1?.stoper == e2?.stoper;
  }

  @override
  int hash(PassegerRecord? e) =>
      const ListEquality().hash([e?.name, e?.phone, e?.stoper]);

  @override
  bool isValidKey(Object? o) => o is PassegerRecord;
}
