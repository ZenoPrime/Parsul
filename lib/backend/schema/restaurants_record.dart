import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "cover_image" field.
  String? _coverImage;
  String get coverImage => _coverImage ?? '';
  bool hasCoverImage() => _coverImage != null;

  // "avg_delivery_time" field.
  String? _avgDeliveryTime;
  String get avgDeliveryTime => _avgDeliveryTime ?? '';
  bool hasAvgDeliveryTime() => _avgDeliveryTime != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "open" field.
  DateTime? _open;
  DateTime? get open => _open;
  bool hasOpen() => _open != null;

  // "closed" field.
  DateTime? _closed;
  DateTime? get closed => _closed;
  bool hasClosed() => _closed != null;

  // "delivery_close" field.
  DateTime? _deliveryClose;
  DateTime? get deliveryClose => _deliveryClose;
  bool hasDeliveryClose() => _deliveryClose != null;

  // "delivery_open" field.
  DateTime? _deliveryOpen;
  DateTime? get deliveryOpen => _deliveryOpen;
  bool hasDeliveryOpen() => _deliveryOpen != null;

  // "todays_pick" field.
  bool? _todaysPick;
  bool get todaysPick => _todaysPick ?? false;
  bool hasTodaysPick() => _todaysPick != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _address = snapshotData['address'] as String?;
    _image = snapshotData['image'] as String?;
    _coverImage = snapshotData['cover_image'] as String?;
    _avgDeliveryTime = snapshotData['avg_delivery_time'] as String?;
    _phone = snapshotData['phone'] as String?;
    _open = snapshotData['open'] as DateTime?;
    _closed = snapshotData['closed'] as DateTime?;
    _deliveryClose = snapshotData['delivery_close'] as DateTime?;
    _deliveryOpen = snapshotData['delivery_open'] as DateTime?;
    _todaysPick = snapshotData['todays_pick'] as bool?;
    _tags = getDataList(snapshotData['tags']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? name,
  String? description,
  double? rating,
  String? address,
  String? image,
  String? coverImage,
  String? avgDeliveryTime,
  String? phone,
  DateTime? open,
  DateTime? closed,
  DateTime? deliveryClose,
  DateTime? deliveryOpen,
  bool? todaysPick,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'rating': rating,
      'address': address,
      'image': image,
      'cover_image': coverImage,
      'avg_delivery_time': avgDeliveryTime,
      'phone': phone,
      'open': open,
      'closed': closed,
      'delivery_close': deliveryClose,
      'delivery_open': deliveryOpen,
      'todays_pick': todaysPick,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.rating == e2?.rating &&
        e1?.address == e2?.address &&
        e1?.image == e2?.image &&
        e1?.coverImage == e2?.coverImage &&
        e1?.avgDeliveryTime == e2?.avgDeliveryTime &&
        e1?.phone == e2?.phone &&
        e1?.open == e2?.open &&
        e1?.closed == e2?.closed &&
        e1?.deliveryClose == e2?.deliveryClose &&
        e1?.deliveryOpen == e2?.deliveryOpen &&
        e1?.todaysPick == e2?.todaysPick &&
        listEquality.equals(e1?.tags, e2?.tags);
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.rating,
        e?.address,
        e?.image,
        e?.coverImage,
        e?.avgDeliveryTime,
        e?.phone,
        e?.open,
        e?.closed,
        e?.deliveryClose,
        e?.deliveryOpen,
        e?.todaysPick,
        e?.tags
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
