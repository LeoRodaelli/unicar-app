// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileStruct extends FFFirebaseStruct {
  ProfileStruct({
    CarStruct? car,
    String? name,
    String? email,
    String? ra,
    String? phone,
    String? university,
    int? age,
    String? driverLicense,
    String? imagePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _car = car,
        _name = name,
        _email = email,
        _ra = ra,
        _phone = phone,
        _university = university,
        _age = age,
        _driverLicense = driverLicense,
        _imagePath = imagePath,
        super(firestoreUtilData);

  // "car" field.
  CarStruct? _car;
  CarStruct get car => _car ?? CarStruct();
  set car(CarStruct? val) => _car = val;
  void updateCar(Function(CarStruct) updateFn) =>
      updateFn(_car ??= CarStruct());
  bool hasCar() => _car != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "ra" field.
  String? _ra;
  String get ra => _ra ?? '';
  set ra(String? val) => _ra = val;
  bool hasRa() => _ra != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  set university(String? val) => _university = val;
  bool hasUniversity() => _university != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "driverLicense" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;
  bool hasImagePath() => _imagePath != null;

  static ProfileStruct fromMap(Map<String, dynamic> data) => ProfileStruct(
        car: CarStruct.maybeFromMap(data['car']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        ra: data['ra'] as String?,
        phone: data['phone'] as String?,
        university: data['university'] as String?,
        age: castToType<int>(data['age']),
        driverLicense: data['driverLicense'] as String?,
        imagePath: data['imagePath'] as String?,
      );

  static ProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'car': _car?.toMap(),
        'name': _name,
        'email': _email,
        'ra': _ra,
        'phone': _phone,
        'university': _university,
        'age': _age,
        'driverLicense': _driverLicense,
        'imagePath': _imagePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'car': serializeParam(
          _car,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'ra': serializeParam(
          _ra,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'university': serializeParam(
          _university,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'driverLicense': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProfileStruct(
        car: deserializeStructParam(
          data['car'],
          ParamType.DataStruct,
          false,
          structBuilder: CarStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        ra: deserializeParam(
          data['ra'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        university: deserializeParam(
          data['university'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        driverLicense: deserializeParam(
          data['driverLicense'],
          ParamType.String,
          false,
        ),
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProfileStruct &&
        car == other.car &&
        name == other.name &&
        email == other.email &&
        ra == other.ra &&
        phone == other.phone &&
        university == other.university &&
        age == other.age &&
        driverLicense == other.driverLicense &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [car, name, email, ra, phone, university, age, driverLicense, imagePath]);
}

ProfileStruct createProfileStruct({
  CarStruct? car,
  String? name,
  String? email,
  String? ra,
  String? phone,
  String? university,
  int? age,
  String? driverLicense,
  String? imagePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProfileStruct(
      car: car ?? (clearUnsetFields ? CarStruct() : null),
      name: name,
      email: email,
      ra: ra,
      phone: phone,
      university: university,
      age: age,
      driverLicense: driverLicense,
      imagePath: imagePath,
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
