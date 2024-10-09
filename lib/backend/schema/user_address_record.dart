import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAddressRecord extends FirestoreRecord {
  UserAddressRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  bool hasZip() => _zip != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _street = snapshotData['street'] as String?;
    _city = snapshotData['city'] as String?;
    _zip = snapshotData['zip'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_address');

  static Stream<UserAddressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAddressRecord.fromSnapshot(s));

  static Future<UserAddressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAddressRecord.fromSnapshot(s));

  static UserAddressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAddressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAddressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAddressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAddressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAddressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAddressRecordData({
  String? street,
  String? city,
  String? zip,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'street': street,
      'city': city,
      'zip': zip,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAddressRecordDocumentEquality implements Equality<UserAddressRecord> {
  const UserAddressRecordDocumentEquality();

  @override
  bool equals(UserAddressRecord? e1, UserAddressRecord? e2) {
    return e1?.street == e2?.street &&
        e1?.city == e2?.city &&
        e1?.zip == e2?.zip &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(UserAddressRecord? e) =>
      const ListEquality().hash([e?.street, e?.city, e?.zip, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is UserAddressRecord;
}
