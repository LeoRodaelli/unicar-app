// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerfilStruct extends FFFirebaseStruct {
  PerfilStruct({
    String? emailUniversitarioPerfil,
    String? phonePerfil,
    String? agePerfil,
    String? carPerfil,
    String? plateCarPerfil,
    String? colorPerfil,
    String? raPerfil,
    String? namePerfil,
    String? universidadePerfil,
    String? imagePerfil,
    String? drivinglicence,
    String? passwordPerfil,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _emailUniversitarioPerfil = emailUniversitarioPerfil,
        _phonePerfil = phonePerfil,
        _agePerfil = agePerfil,
        _carPerfil = carPerfil,
        _plateCarPerfil = plateCarPerfil,
        _colorPerfil = colorPerfil,
        _raPerfil = raPerfil,
        _namePerfil = namePerfil,
        _universidadePerfil = universidadePerfil,
        _imagePerfil = imagePerfil,
        _drivinglicence = drivinglicence,
        _passwordPerfil = passwordPerfil,
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

  // "carPerfil" field.
  String? _carPerfil;
  String get carPerfil => _carPerfil ?? '';
  set carPerfil(String? val) => _carPerfil = val;
  bool hasCarPerfil() => _carPerfil != null;

  // "plateCarPerfil" field.
  String? _plateCarPerfil;
  String get plateCarPerfil => _plateCarPerfil ?? '';
  set plateCarPerfil(String? val) => _plateCarPerfil = val;
  bool hasPlateCarPerfil() => _plateCarPerfil != null;

  // "colorPerfil" field.
  String? _colorPerfil;
  String get colorPerfil => _colorPerfil ?? '';
  set colorPerfil(String? val) => _colorPerfil = val;
  bool hasColorPerfil() => _colorPerfil != null;

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

  // "passwordPerfil" field.
  String? _passwordPerfil;
  String get passwordPerfil => _passwordPerfil ?? '';
  set passwordPerfil(String? val) => _passwordPerfil = val;
  bool hasPasswordPerfil() => _passwordPerfil != null;

  static PerfilStruct fromMap(Map<String, dynamic> data) => PerfilStruct(
        emailUniversitarioPerfil: data['emailUniversitarioPerfil'] as String?,
        phonePerfil: data['phonePerfil'] as String?,
        agePerfil: data['agePerfil'] as String?,
        carPerfil: data['carPerfil'] as String?,
        plateCarPerfil: data['plateCarPerfil'] as String?,
        colorPerfil: data['colorPerfil'] as String?,
        raPerfil: data['raPerfil'] as String?,
        namePerfil: data['namePerfil'] as String?,
        universidadePerfil: data['universidadePerfil'] as String?,
        imagePerfil: data['imagePerfil'] as String?,
        drivinglicence: data['drivinglicence'] as String?,
        passwordPerfil: data['passwordPerfil'] as String?,
      );

  static PerfilStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PerfilStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'emailUniversitarioPerfil': _emailUniversitarioPerfil,
        'phonePerfil': _phonePerfil,
        'agePerfil': _agePerfil,
        'carPerfil': _carPerfil,
        'plateCarPerfil': _plateCarPerfil,
        'colorPerfil': _colorPerfil,
        'raPerfil': _raPerfil,
        'namePerfil': _namePerfil,
        'universidadePerfil': _universidadePerfil,
        'imagePerfil': _imagePerfil,
        'drivinglicence': _drivinglicence,
        'passwordPerfil': _passwordPerfil,
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
        'carPerfil': serializeParam(
          _carPerfil,
          ParamType.String,
        ),
        'plateCarPerfil': serializeParam(
          _plateCarPerfil,
          ParamType.String,
        ),
        'colorPerfil': serializeParam(
          _colorPerfil,
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
        'passwordPerfil': serializeParam(
          _passwordPerfil,
          ParamType.String,
        ),
      }.withoutNulls;

  static PerfilStruct fromSerializableMap(Map<String, dynamic> data) =>
      PerfilStruct(
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
        carPerfil: deserializeParam(
          data['carPerfil'],
          ParamType.String,
          false,
        ),
        plateCarPerfil: deserializeParam(
          data['plateCarPerfil'],
          ParamType.String,
          false,
        ),
        colorPerfil: deserializeParam(
          data['colorPerfil'],
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
        passwordPerfil: deserializeParam(
          data['passwordPerfil'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PerfilStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PerfilStruct &&
        emailUniversitarioPerfil == other.emailUniversitarioPerfil &&
        phonePerfil == other.phonePerfil &&
        agePerfil == other.agePerfil &&
        carPerfil == other.carPerfil &&
        plateCarPerfil == other.plateCarPerfil &&
        colorPerfil == other.colorPerfil &&
        raPerfil == other.raPerfil &&
        namePerfil == other.namePerfil &&
        universidadePerfil == other.universidadePerfil &&
        imagePerfil == other.imagePerfil &&
        drivinglicence == other.drivinglicence &&
        passwordPerfil == other.passwordPerfil;
  }

  @override
  int get hashCode => const ListEquality().hash([
        emailUniversitarioPerfil,
        phonePerfil,
        agePerfil,
        carPerfil,
        plateCarPerfil,
        colorPerfil,
        raPerfil,
        namePerfil,
        universidadePerfil,
        imagePerfil,
        drivinglicence,
        passwordPerfil
      ]);
}

PerfilStruct createPerfilStruct({
  String? emailUniversitarioPerfil,
  String? phonePerfil,
  String? agePerfil,
  String? carPerfil,
  String? plateCarPerfil,
  String? colorPerfil,
  String? raPerfil,
  String? namePerfil,
  String? universidadePerfil,
  String? imagePerfil,
  String? drivinglicence,
  String? passwordPerfil,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PerfilStruct(
      emailUniversitarioPerfil: emailUniversitarioPerfil,
      phonePerfil: phonePerfil,
      agePerfil: agePerfil,
      carPerfil: carPerfil,
      plateCarPerfil: plateCarPerfil,
      colorPerfil: colorPerfil,
      raPerfil: raPerfil,
      namePerfil: namePerfil,
      universidadePerfil: universidadePerfil,
      imagePerfil: imagePerfil,
      drivinglicence: drivinglicence,
      passwordPerfil: passwordPerfil,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PerfilStruct? updatePerfilStruct(
  PerfilStruct? perfil, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    perfil
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPerfilStructData(
  Map<String, dynamic> firestoreData,
  PerfilStruct? perfil,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (perfil == null) {
    return;
  }
  if (perfil.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && perfil.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final perfilData = getPerfilFirestoreData(perfil, forFieldValue);
  final nestedData = perfilData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = perfil.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPerfilFirestoreData(
  PerfilStruct? perfil, [
  bool forFieldValue = false,
]) {
  if (perfil == null) {
    return {};
  }
  final firestoreData = mapToFirestore(perfil.toMap());

  // Add any Firestore field values
  perfil.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPerfilListFirestoreData(
  List<PerfilStruct>? perfils,
) =>
    perfils?.map((e) => getPerfilFirestoreData(e, true)).toList() ?? [];
