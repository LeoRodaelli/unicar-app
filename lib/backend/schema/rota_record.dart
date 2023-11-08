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

  // "local" field.
  LatLng? _local;
  LatLng? get local => _local;
  bool hasLocal() => _local != null;

  // "destino" field.
  LatLng? _destino;
  LatLng? get destino => _destino;
  bool hasDestino() => _destino != null;

  void _initializeFields() {
    _local = snapshotData['local'] as LatLng?;
    _destino = snapshotData['destino'] as LatLng?;
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
  LatLng? local,
  LatLng? destino,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'local': local,
      'destino': destino,
    }.withoutNulls,
  );

  return firestoreData;
}

class RotaRecordDocumentEquality implements Equality<RotaRecord> {
  const RotaRecordDocumentEquality();

  @override
  bool equals(RotaRecord? e1, RotaRecord? e2) {
    return e1?.local == e2?.local && e1?.destino == e2?.destino;
  }

  @override
  int hash(RotaRecord? e) => const ListEquality().hash([e?.local, e?.destino]);

  @override
  bool isValidKey(Object? o) => o is RotaRecord;
}
