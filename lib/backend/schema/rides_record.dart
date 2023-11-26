import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RidesRecord extends FirestoreRecord {
  RidesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rides" field.
  List<RideModelStruct>? _rides;
  List<RideModelStruct> get rides => _rides ?? const [];
  bool hasRides() => _rides != null;

  void _initializeFields() {
    _rides = getStructList(
      snapshotData['rides'],
      RideModelStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rides');

  static Stream<RidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RidesRecord.fromSnapshot(s));

  static Future<RidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RidesRecord.fromSnapshot(s));

  static RidesRecord fromSnapshot(DocumentSnapshot snapshot) => RidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRidesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class RidesRecordDocumentEquality implements Equality<RidesRecord> {
  const RidesRecordDocumentEquality();

  @override
  bool equals(RidesRecord? e1, RidesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.rides, e2?.rides);
  }

  @override
  int hash(RidesRecord? e) => const ListEquality().hash([e?.rides]);

  @override
  bool isValidKey(Object? o) => o is RidesRecord;
}
