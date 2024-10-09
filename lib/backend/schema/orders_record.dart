import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "pickup_location" field.
  String? _pickupLocation;
  String get pickupLocation => _pickupLocation ?? '';
  bool hasPickupLocation() => _pickupLocation != null;

  // "delivery_location" field.
  String? _deliveryLocation;
  String get deliveryLocation => _deliveryLocation ?? '';
  bool hasDeliveryLocation() => _deliveryLocation != null;

  // "order_items" field.
  List<CartItemTypeStruct>? _orderItems;
  List<CartItemTypeStruct> get orderItems => _orderItems ?? const [];
  bool hasOrderItems() => _orderItems != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _pickupLocation = snapshotData['pickup_location'] as String?;
    _deliveryLocation = snapshotData['delivery_location'] as String?;
    _orderItems = getStructList(
      snapshotData['order_items'],
      CartItemTypeStruct.fromMap,
    );
    _paymentMethod = snapshotData['payment_method'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('orders')
          : FirebaseFirestore.instance.collectionGroup('orders');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('orders').doc(id);

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? createdAt,
  String? status,
  String? pickupLocation,
  String? deliveryLocation,
  String? paymentMethod,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'status': status,
      'pickup_location': pickupLocation,
      'delivery_location': deliveryLocation,
      'payment_method': paymentMethod,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.pickupLocation == e2?.pickupLocation &&
        e1?.deliveryLocation == e2?.deliveryLocation &&
        listEquality.equals(e1?.orderItems, e2?.orderItems) &&
        e1?.paymentMethod == e2?.paymentMethod;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.status,
        e?.pickupLocation,
        e?.deliveryLocation,
        e?.orderItems,
        e?.paymentMethod
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
