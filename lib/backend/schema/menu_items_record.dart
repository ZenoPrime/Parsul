import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuItemsRecord extends FirestoreRecord {
  MenuItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "most_popular" field.
  bool? _mostPopular;
  bool get mostPopular => _mostPopular ?? false;
  bool hasMostPopular() => _mostPopular != null;

  // "user_favourite" field.
  List<DocumentReference>? _userFavourite;
  List<DocumentReference> get userFavourite => _userFavourite ?? const [];
  bool hasUserFavourite() => _userFavourite != null;

  // "category" field.
  List<CategoriesStruct>? _category;
  List<CategoriesStruct> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _image = snapshotData['image'] as String?;
    _mostPopular = snapshotData['most_popular'] as bool?;
    _userFavourite = getDataList(snapshotData['user_favourite']);
    _category = getStructList(
      snapshotData['category'],
      CategoriesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menuItems')
          : FirebaseFirestore.instance.collectionGroup('menuItems');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menuItems').doc(id);

  static Stream<MenuItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemsRecord.fromSnapshot(s));

  static Future<MenuItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuItemsRecord.fromSnapshot(s));

  static MenuItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemsRecordData({
  double? price,
  String? name,
  String? description,
  double? rating,
  String? image,
  bool? mostPopular,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'name': name,
      'description': description,
      'rating': rating,
      'image': image,
      'most_popular': mostPopular,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemsRecordDocumentEquality implements Equality<MenuItemsRecord> {
  const MenuItemsRecordDocumentEquality();

  @override
  bool equals(MenuItemsRecord? e1, MenuItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.price == e2?.price &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating &&
        e1?.image == e2?.image &&
        e1?.mostPopular == e2?.mostPopular &&
        listEquality.equals(e1?.userFavourite, e2?.userFavourite) &&
        listEquality.equals(e1?.category, e2?.category);
  }

  @override
  int hash(MenuItemsRecord? e) => const ListEquality().hash([
        e?.price,
        e?.name,
        e?.description,
        e?.rating,
        e?.image,
        e?.mostPopular,
        e?.userFavourite,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuItemsRecord;
}
