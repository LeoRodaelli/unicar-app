import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferRideRecord extends FirestoreRecord {
  OfferRideRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "offerRedes" field.
  OfferRideStruct? _offerRedes;
  OfferRideStruct get offerRedes => _offerRedes ?? OfferRideStruct();
  bool hasOfferRedes() => _offerRedes != null;

  void _initializeFields() {
    _offerRedes = OfferRideStruct.maybeFromMap(snapshotData['offerRedes']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offerRide');

  static Stream<OfferRideRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfferRideRecord.fromSnapshot(s));

  static Future<OfferRideRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfferRideRecord.fromSnapshot(s));

  static OfferRideRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OfferRideRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfferRideRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfferRideRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfferRideRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfferRideRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfferRideRecordData({
  OfferRideStruct? offerRedes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offerRedes': OfferRideStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "offerRedes" field.
  addOfferRideStructData(firestoreData, offerRedes, 'offerRedes');

  return firestoreData;
}

class OfferRideRecordDocumentEquality implements Equality<OfferRideRecord> {
  const OfferRideRecordDocumentEquality();

  @override
  bool equals(OfferRideRecord? e1, OfferRideRecord? e2) {
    return e1?.offerRedes == e2?.offerRedes;
  }

  @override
  int hash(OfferRideRecord? e) => const ListEquality().hash([e?.offerRedes]);

  @override
  bool isValidKey(Object? o) => o is OfferRideRecord;
}
