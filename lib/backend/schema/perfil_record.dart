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

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "contato_numero" field.
  int? _contatoNumero;
  int get contatoNumero => _contatoNumero ?? 0;
  bool hasContatoNumero() => _contatoNumero != null;

  // "universidade" field.
  String? _universidade;
  String get universidade => _universidade ?? '';
  bool hasUniversidade() => _universidade != null;

  // "idade" field.
  int? _idade;
  int get idade => _idade ?? 0;
  bool hasIdade() => _idade != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _email = snapshotData['email'] as String?;
    _contatoNumero = castToType<int>(snapshotData['contato_numero']);
    _universidade = snapshotData['universidade'] as String?;
    _idade = castToType<int>(snapshotData['idade']);
    _uid = snapshotData['uid'] as String?;
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
  String? nome,
  String? email,
  int? contatoNumero,
  String? universidade,
  int? idade,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'email': email,
      'contato_numero': contatoNumero,
      'universidade': universidade,
      'idade': idade,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PerfilRecordDocumentEquality implements Equality<PerfilRecord> {
  const PerfilRecordDocumentEquality();

  @override
  bool equals(PerfilRecord? e1, PerfilRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.email == e2?.email &&
        e1?.contatoNumero == e2?.contatoNumero &&
        e1?.universidade == e2?.universidade &&
        e1?.idade == e2?.idade &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(PerfilRecord? e) => const ListEquality().hash(
      [e?.nome, e?.email, e?.contatoNumero, e?.universidade, e?.idade, e?.uid]);

  @override
  bool isValidKey(Object? o) => o is PerfilRecord;
}
