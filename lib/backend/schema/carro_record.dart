import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarroRecord extends FirestoreRecord {
  CarroRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "modelo_carro" field.
  String? _modeloCarro;
  String get modeloCarro => _modeloCarro ?? '';
  bool hasModeloCarro() => _modeloCarro != null;

  // "cor" field.
  String? _cor;
  String get cor => _cor ?? '';
  bool hasCor() => _cor != null;

  // "placa_carro" field.
  String? _placaCarro;
  String get placaCarro => _placaCarro ?? '';
  bool hasPlacaCarro() => _placaCarro != null;

  // "cnh_condutor" field.
  int? _cnhCondutor;
  int get cnhCondutor => _cnhCondutor ?? 0;
  bool hasCnhCondutor() => _cnhCondutor != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _modeloCarro = snapshotData['modelo_carro'] as String?;
    _cor = snapshotData['cor'] as String?;
    _placaCarro = snapshotData['placa_carro'] as String?;
    _cnhCondutor = castToType<int>(snapshotData['cnh_condutor']);
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carro');

  static Stream<CarroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarroRecord.fromSnapshot(s));

  static Future<CarroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarroRecord.fromSnapshot(s));

  static CarroRecord fromSnapshot(DocumentSnapshot snapshot) => CarroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarroRecordData({
  String? modeloCarro,
  String? cor,
  String? placaCarro,
  int? cnhCondutor,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'modelo_carro': modeloCarro,
      'cor': cor,
      'placa_carro': placaCarro,
      'cnh_condutor': cnhCondutor,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarroRecordDocumentEquality implements Equality<CarroRecord> {
  const CarroRecordDocumentEquality();

  @override
  bool equals(CarroRecord? e1, CarroRecord? e2) {
    return e1?.modeloCarro == e2?.modeloCarro &&
        e1?.cor == e2?.cor &&
        e1?.placaCarro == e2?.placaCarro &&
        e1?.cnhCondutor == e2?.cnhCondutor &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(CarroRecord? e) => const ListEquality()
      .hash([e?.modeloCarro, e?.cor, e?.placaCarro, e?.cnhCondutor, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is CarroRecord;
}
