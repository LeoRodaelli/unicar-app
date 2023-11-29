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

  // "offerRide" field.
  List<OfferRideStruct>? _offerRide;
  List<OfferRideStruct> get offerRide => _offerRide ?? const [];
  bool hasOfferRide() => _offerRide != null;

  void _initializeFields() {
    _offerRide = getStructList(
      snapshotData['offerRide'],
      OfferRideStruct.fromMap,
    );
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

Map<String, dynamic> createOfferRideRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class OfferRideRecordDocumentEquality implements Equality<OfferRideRecord> {
  const OfferRideRecordDocumentEquality();

  @override
  bool equals(OfferRideRecord? e1, OfferRideRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.offerRide, e2?.offerRide);
  }

  @override
  int hash(OfferRideRecord? e) => const ListEquality().hash([e?.offerRide]);

  @override
  bool isValidKey(Object? o) => o is OfferRideRecord;
}
