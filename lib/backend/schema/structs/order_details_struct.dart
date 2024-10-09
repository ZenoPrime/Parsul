// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OrderDetailsStruct extends FFFirebaseStruct {
  OrderDetailsStruct({
    String? deliveryLocation,
    String? paymentMethod,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _deliveryLocation = deliveryLocation,
        _paymentMethod = paymentMethod,
        super(firestoreUtilData);

  // "deliveryLocation" field.
  String? _deliveryLocation;
  String get deliveryLocation =>
      _deliveryLocation ?? 'LatLng(lat: 28.5530, lng: 77.59386)';
  set deliveryLocation(String? val) => _deliveryLocation = val;

  bool hasDeliveryLocation() => _deliveryLocation != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? 'Cash';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  static OrderDetailsStruct fromMap(Map<String, dynamic> data) =>
      OrderDetailsStruct(
        deliveryLocation: data['deliveryLocation'] as String?,
        paymentMethod: data['paymentMethod'] as String?,
      );

  static OrderDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'deliveryLocation': _deliveryLocation,
        'paymentMethod': _paymentMethod,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'deliveryLocation': serializeParam(
          _deliveryLocation,
          ParamType.String,
        ),
        'paymentMethod': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
      }.withoutNulls;

  static OrderDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderDetailsStruct(
        deliveryLocation: deserializeParam(
          data['deliveryLocation'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['paymentMethod'],
          ParamType.String,
          false,
        ),
      );

  static OrderDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      OrderDetailsStruct(
        deliveryLocation: convertAlgoliaParam(
          data['deliveryLocation'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['paymentMethod'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OrderDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderDetailsStruct &&
        deliveryLocation == other.deliveryLocation &&
        paymentMethod == other.paymentMethod;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([deliveryLocation, paymentMethod]);
}

OrderDetailsStruct createOrderDetailsStruct({
  String? deliveryLocation,
  String? paymentMethod,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderDetailsStruct(
      deliveryLocation: deliveryLocation,
      paymentMethod: paymentMethod,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderDetailsStruct? updateOrderDetailsStruct(
  OrderDetailsStruct? orderDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderDetailsStructData(
  Map<String, dynamic> firestoreData,
  OrderDetailsStruct? orderDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderDetails == null) {
    return;
  }
  if (orderDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderDetailsData =
      getOrderDetailsFirestoreData(orderDetails, forFieldValue);
  final nestedData =
      orderDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderDetailsFirestoreData(
  OrderDetailsStruct? orderDetails, [
  bool forFieldValue = false,
]) {
  if (orderDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderDetails.toMap());

  // Add any Firestore field values
  orderDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderDetailsListFirestoreData(
  List<OrderDetailsStruct>? orderDetailss,
) =>
    orderDetailss?.map((e) => getOrderDetailsFirestoreData(e, true)).toList() ??
    [];
