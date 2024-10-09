// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserAddressStruct extends FFFirebaseStruct {
  UserAddressStruct({
    LatLng? longLat,
    String? address,
    String? city,
    String? specialDirection,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _longLat = longLat,
        _address = address,
        _city = city,
        _specialDirection = specialDirection,
        super(firestoreUtilData);

  // "long_lat" field.
  LatLng? _longLat;
  LatLng? get longLat => _longLat;
  set longLat(LatLng? val) => _longLat = val;

  bool hasLongLat() => _longLat != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? 'Freetown';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "special_direction" field.
  String? _specialDirection;
  String get specialDirection => _specialDirection ?? '';
  set specialDirection(String? val) => _specialDirection = val;

  bool hasSpecialDirection() => _specialDirection != null;

  static UserAddressStruct fromMap(Map<String, dynamic> data) =>
      UserAddressStruct(
        longLat: data['long_lat'] as LatLng?,
        address: data['address'] as String?,
        city: data['city'] as String?,
        specialDirection: data['special_direction'] as String?,
      );

  static UserAddressStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAddressStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'long_lat': _longLat,
        'address': _address,
        'city': _city,
        'special_direction': _specialDirection,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'long_lat': serializeParam(
          _longLat,
          ParamType.LatLng,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'special_direction': serializeParam(
          _specialDirection,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAddressStruct(
        longLat: deserializeParam(
          data['long_lat'],
          ParamType.LatLng,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        specialDirection: deserializeParam(
          data['special_direction'],
          ParamType.String,
          false,
        ),
      );

  static UserAddressStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserAddressStruct(
        longLat: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        address: convertAlgoliaParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: convertAlgoliaParam(
          data['city'],
          ParamType.String,
          false,
        ),
        specialDirection: convertAlgoliaParam(
          data['special_direction'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAddressStruct &&
        longLat == other.longLat &&
        address == other.address &&
        city == other.city &&
        specialDirection == other.specialDirection;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([longLat, address, city, specialDirection]);
}

UserAddressStruct createUserAddressStruct({
  LatLng? longLat,
  String? address,
  String? city,
  String? specialDirection,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAddressStruct(
      longLat: longLat,
      address: address,
      city: city,
      specialDirection: specialDirection,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAddressStruct? updateUserAddressStruct(
  UserAddressStruct? userAddress, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAddress
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAddressStructData(
  Map<String, dynamic> firestoreData,
  UserAddressStruct? userAddress,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAddress == null) {
    return;
  }
  if (userAddress.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAddress.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAddressData =
      getUserAddressFirestoreData(userAddress, forFieldValue);
  final nestedData =
      userAddressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAddress.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAddressFirestoreData(
  UserAddressStruct? userAddress, [
  bool forFieldValue = false,
]) {
  if (userAddress == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAddress.toMap());

  // Add any Firestore field values
  userAddress.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAddressListFirestoreData(
  List<UserAddressStruct>? userAddresss,
) =>
    userAddresss?.map((e) => getUserAddressFirestoreData(e, true)).toList() ??
    [];
