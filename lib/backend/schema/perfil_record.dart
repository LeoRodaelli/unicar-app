import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerfilRecord extends FirestoreRecord {
  PerfilRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "perfil" field.
  PerfilStruct? _perfil;
  PerfilStruct get perfil => _perfil ?? PerfilStruct();
  bool hasPerfil() => _perfil != null;

  void _initializeFields() {
    _perfil = PerfilStruct.maybeFromMap(snapshotData['perfil']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('perfil');

  static Stream<PerfilRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PerfilRecord.fromSnapshot(s));

  static Future<PerfilRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PerfilRecord.fromSnapshot(s));

  static PerfilRecord fromSnapshot(DocumentSnapshot snapshot) => PerfilRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PerfilRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PerfilRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PerfilRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PerfilRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPerfilRecordData({
  PerfilStruct? perfil,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'perfil': PerfilStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "perfil" field.
  addPerfilStructData(firestoreData, perfil, 'perfil');

  return firestoreData;
}

class PerfilRecordDocumentEquality implements Equality<PerfilRecord> {
  const PerfilRecordDocumentEquality();

  @override
  bool equals(PerfilRecord? e1, PerfilRecord? e2) {
    return e1?.perfil == e2?.perfil;
  }

  @override
  int hash(PerfilRecord? e) => const ListEquality().hash([e?.perfil]);

  @override
  bool isValidKey(Object? o) => o is PerfilRecord;
}
