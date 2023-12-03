// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    String? emailUniversitarioPerfil,
    String? phonePerfil,
    String? agePerfil,
    String? raPerfil,
    String? namePerfil,
    String? universidadePerfil,
    String? imagePerfil,
    String? drivinglicence,
    CarStruct? car,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emailUniversitarioPerfil = emailUniversitarioPerfil,
        _phonePerfil = phonePerfil,
        _agePerfil = agePerfil,
        _raPerfil = raPerfil,
        _namePerfil = namePerfil,
        _universidadePerfil = universidadePerfil,
        _imagePerfil = imagePerfil,
        _drivinglicence = drivinglicence,
        _car = car,
        super(firestoreUtilData);

  // "emailUniversitarioPerfil" field.
  String? _emailUniversitarioPerfil;
  String get emailUniversitarioPerfil => _emailUniversitarioPerfil ?? '';
  set emailUniversitarioPerfil(String? val) => _emailUniversitarioPerfil = val;
  bool hasEmailUniversitarioPerfil() => _emailUniversitarioPerfil != null;

  // "phonePerfil" field.
  String? _phonePerfil;
  String get phonePerfil => _phonePerfil ?? '';
  set phonePerfil(String? val) => _phonePerfil = val;
  bool hasPhonePerfil() => _phonePerfil != null;

  // "agePerfil" field.
  String? _agePerfil;
  String get agePerfil => _agePerfil ?? '';
  set agePerfil(String? val) => _agePerfil = val;
  bool hasAgePerfil() => _agePerfil != null;

  // "raPerfil" field.
  String? _raPerfil;
  String get raPerfil => _raPerfil ?? '';
  set raPerfil(String? val) => _raPerfil = val;
  bool hasRaPerfil() => _raPerfil != null;

  // "namePerfil" field.
  String? _namePerfil;
  String get namePerfil => _namePerfil ?? '';
  set namePerfil(String? val) => _namePerfil = val;
  bool hasNamePerfil() => _namePerfil != null;

  // "universidadePerfil" field.
  String? _universidadePerfil;
  String get universidadePerfil => _universidadePerfil ?? '';
  set universidadePerfil(String? val) => _universidadePerfil = val;
  bool hasUniversidadePerfil() => _universidadePerfil != null;

  // "imagePerfil" field.
  String? _imagePerfil;
  String get imagePerfil => _imagePerfil ?? '';
  set imagePerfil(String? val) => _imagePerfil = val;
  bool hasImagePerfil() => _imagePerfil != null;

  // "drivinglicence" field.
  String? _drivinglicence;
  String get drivinglicence => _drivinglicence ?? '';
  set drivinglicence(String? val) => _drivinglicence = val;
  bool hasDrivinglicence() => _drivinglicence != null;

  // "car" field.
  CarStruct? _car;
  CarStruct get car => _car ?? CarStruct();
  set car(CarStruct? val) => _car = val;
  void updateCar(Function(CarStruct) updateFn) =>
      updateFn(_car ??= CarStruct());
  bool hasCar() => _car != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        emailUniversitarioPerfil: data['emailUniversitarioPerfil'] as String?,
        phonePerfil: data['phonePerfil'] as String?,
        agePerfil: data['agePerfil'] as String?,
        raPerfil: data['raPerfil'] as String?,
        namePerfil: data['namePerfil'] as String?,
        universidadePerfil: data['universidadePerfil'] as String?,
        imagePerfil: data['imagePerfil'] as String?,
        drivinglicence: data['drivinglicence'] as String?,
        car: CarStruct.maybeFromMap(data['car']),
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'emailUniversitarioPerfil': _emailUniversitarioPerfil,
        'phonePerfil': _phonePerfil,
        'agePerfil': _agePerfil,
        'raPerfil': _raPerfil,
        'namePerfil': _namePerfil,
        'universidadePerfil': _universidadePerfil,
        'imagePerfil': _imagePerfil,
        'drivinglicence': _drivinglicence,
        'car': _car?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emailUniversitarioPerfil': serializeParam(
          _emailUniversitarioPerfil,
          ParamType.String,
        ),
        'phonePerfil': serializeParam(
          _phonePerfil,
          ParamType.String,
        ),
        'agePerfil': serializeParam(
          _agePerfil,
          ParamType.String,
        ),
        'raPerfil': serializeParam(
          _raPerfil,
          ParamType.String,
        ),
        'namePerfil': serializeParam(
          _namePerfil,
          ParamType.String,
        ),
        'universidadePerfil': serializeParam(
          _universidadePerfil,
          ParamType.String,
        ),
        'imagePerfil': serializeParam(
          _imagePerfil,
          ParamType.String,
        ),
        'drivinglicence': serializeParam(
          _drivinglicence,
          ParamType.String,
        ),
        'car': serializeParam(
          _car,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        emailUniversitarioPerfil: deserializeParam(
          data['emailUniversitarioPerfil'],
          ParamType.String,
          false,
        ),
        phonePerfil: deserializeParam(
          data['phonePerfil'],
          ParamType.String,
          false,
        ),
        agePerfil: deserializeParam(
          data['agePerfil'],
          ParamType.String,
          false,
        ),
        raPerfil: deserializeParam(
          data['raPerfil'],
          ParamType.String,
          false,
        ),
        namePerfil: deserializeParam(
          data['namePerfil'],
          ParamType.String,
          false,
        ),
        universidadePerfil: deserializeParam(
          data['universidadePerfil'],
          ParamType.String,
          false,
        ),
        imagePerfil: deserializeParam(
          data['imagePerfil'],
          ParamType.String,
          false,
        ),
        drivinglicence: deserializeParam(
          data['drivinglicence'],
          ParamType.String,
          false,
        ),
        car: deserializeStructParam(
          data['car'],
          ParamType.DataStruct,
          false,
          structBuilder: CarStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        emailUniversitarioPerfil == other.emailUniversitarioPerfil &&
        phonePerfil == other.phonePerfil &&
        agePerfil == other.agePerfil &&
        raPerfil == other.raPerfil &&
        namePerfil == other.namePerfil &&
        universidadePerfil == other.universidadePerfil &&
        imagePerfil == other.imagePerfil &&
        drivinglicence == other.drivinglicence &&
        car == other.car;
  }

  @override
  int get hashCode => const ListEquality().hash([
        emailUniversitarioPerfil,
        phonePerfil,
        agePerfil,
        raPerfil,
        namePerfil,
        universidadePerfil,
        imagePerfil,
        drivinglicence,
        car
      ]);
}

ProfileStruct createProfileStruct({
  String? emailUniversitarioPerfil,
  String? phonePerfil,
  String? agePerfil,
  String? raPerfil,
  String? namePerfil,
  String? universidadePerfil,
  String? imagePerfil,
  String? drivinglicence,
  CarStruct? car,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      emailUniversitarioPerfil: emailUniversitarioPerfil,
      phonePerfil: phonePerfil,
      agePerfil: agePerfil,
      raPerfil: raPerfil,
      namePerfil: namePerfil,
      universidadePerfil: universidadePerfil,
      imagePerfil: imagePerfil,
      drivinglicence: drivinglicence,
      car: car ?? (clearUnsetFields ? CarStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProfileStruct? updateProfileStruct(
  ProfileStruct? profile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    profile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProfileStructData(
  Map<String, dynamic> firestoreData,
  ProfileStruct? profile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (profile == null) {
    return;
  }
  if (profile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && profile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final profileData = getProfileFirestoreData(profile, forFieldValue);
  final nestedData = profileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = profile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProfileFirestoreData(
  ProfileStruct? profile, [
  bool forFieldValue = false,
]) {
  if (profile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(profile.toMap());

  // Handle nested data for "car" field.
  addCarStructData(
    firestoreData,
    profile.hasCar() ? profile.car : null,
    'car',
    forFieldValue,
  );

  // Add any Firestore field values
  profile.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProfileListFirestoreData(
  List<ProfileStruct>? profiles,
) =>
    profiles?.map((e) => getProfileFirestoreData(e, true)).toList() ?? [];
