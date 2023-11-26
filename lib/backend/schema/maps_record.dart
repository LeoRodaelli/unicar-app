import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MapsRecord extends FirestoreRecord {
  MapsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "destinoPassageiro" field.
  LatLng? _destinoPassageiro;
  LatLng? get destinoPassageiro => _destinoPassageiro;
  bool hasDestinoPassageiro() => _destinoPassageiro != null;

  // "destinoMotorista" field.
  LatLng? _destinoMotorista;
  LatLng? get destinoMotorista => _destinoMotorista;
  bool hasDestinoMotorista() => _destinoMotorista != null;

  // "partidaPassageiro" field.
  LatLng? _partidaPassageiro;
  LatLng? get partidaPassageiro => _partidaPassageiro;
  bool hasPartidaPassageiro() => _partidaPassageiro != null;

  // "partidaMotorista" field.
  LatLng? _partidaMotorista;
  LatLng? get partidaMotorista => _partidaMotorista;
  bool hasPartidaMotorista() => _partidaMotorista != null;

  void _initializeFields() {
    _destinoPassageiro = snapshotData['destinoPassageiro'] as LatLng?;
    _destinoMotorista = snapshotData['destinoMotorista'] as LatLng?;
    _partidaPassageiro = snapshotData['partidaPassageiro'] as LatLng?;
    _partidaMotorista = snapshotData['partidaMotorista'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('maps');

  static Stream<MapsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MapsRecord.fromSnapshot(s));

  static Future<MapsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MapsRecord.fromSnapshot(s));

  static MapsRecord fromSnapshot(DocumentSnapshot snapshot) => MapsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MapsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MapsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MapsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MapsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMapsRecordData({
  LatLng? destinoPassageiro,
  LatLng? destinoMotorista,
  LatLng? partidaPassageiro,
  LatLng? partidaMotorista,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'destinoPassageiro': destinoPassageiro,
      'destinoMotorista': destinoMotorista,
      'partidaPassageiro': partidaPassageiro,
      'partidaMotorista': partidaMotorista,
    }.withoutNulls,
  );

  return firestoreData;
}

class MapsRecordDocumentEquality implements Equality<MapsRecord> {
  const MapsRecordDocumentEquality();

  @override
  bool equals(MapsRecord? e1, MapsRecord? e2) {
    return e1?.destinoPassageiro == e2?.destinoPassageiro &&
        e1?.destinoMotorista == e2?.destinoMotorista &&
        e1?.partidaPassageiro == e2?.partidaPassageiro &&
        e1?.partidaMotorista == e2?.partidaMotorista;
  }

  @override
  int hash(MapsRecord? e) => const ListEquality().hash([
        e?.destinoPassageiro,
        e?.destinoMotorista,
        e?.partidaPassageiro,
        e?.partidaMotorista
      ]);

  @override
  bool isValidKey(Object? o) => o is MapsRecord;
}
