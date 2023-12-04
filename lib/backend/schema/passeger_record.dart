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

  // "passenger" field.
  List<PassegerStruct>? _passenger;
  List<PassegerStruct> get passenger => _passenger ?? const [];
  bool hasPassenger() => _passenger != null;

  void _initializeFields() {
    _passenger = getStructList(
      snapshotData['passenger'],
      PassegerStruct.fromMap,
    );
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

Map<String, dynamic> createPassegerRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PassegerRecordDocumentEquality implements Equality<PassegerRecord> {
  const PassegerRecordDocumentEquality();

  @override
  bool equals(PassegerRecord? e1, PassegerRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.passenger, e2?.passenger);
  }

  @override
  int hash(PassegerRecord? e) => const ListEquality().hash([e?.passenger]);

  @override
  bool isValidKey(Object? o) => o is PassegerRecord;
}
