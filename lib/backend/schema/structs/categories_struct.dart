// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoriesStruct extends FFFirebaseStruct {
  CategoriesStruct({
    String? categoryName,
    String? categoryDescription,
    String? categoryImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryName = categoryName,
        _categoryDescription = categoryDescription,
        _categoryImage = categoryImage,
        super(firestoreUtilData);

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;

  bool hasCategoryName() => _categoryName != null;

  // "categoryDescription" field.
  String? _categoryDescription;
  String get categoryDescription => _categoryDescription ?? '';
  set categoryDescription(String? val) => _categoryDescription = val;

  bool hasCategoryDescription() => _categoryDescription != null;

  // "categoryImage" field.
  String? _categoryImage;
  String get categoryImage => _categoryImage ?? '';
  set categoryImage(String? val) => _categoryImage = val;

  bool hasCategoryImage() => _categoryImage != null;

  static CategoriesStruct fromMap(Map<String, dynamic> data) =>
      CategoriesStruct(
        categoryName: data['category_name'] as String?,
        categoryDescription: data['categoryDescription'] as String?,
        categoryImage: data['categoryImage'] as String?,
      );

  static CategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category_name': _categoryName,
        'categoryDescription': _categoryDescription,
        'categoryImage': _categoryImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category_name': serializeParam(
          _categoryName,
          ParamType.String,
        ),
        'categoryDescription': serializeParam(
          _categoryDescription,
          ParamType.String,
        ),
        'categoryImage': serializeParam(
          _categoryImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriesStruct(
        categoryName: deserializeParam(
          data['category_name'],
          ParamType.String,
          false,
        ),
        categoryDescription: deserializeParam(
          data['categoryDescription'],
          ParamType.String,
          false,
        ),
        categoryImage: deserializeParam(
          data['categoryImage'],
          ParamType.String,
          false,
        ),
      );

  static CategoriesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CategoriesStruct(
        categoryName: convertAlgoliaParam(
          data['category_name'],
          ParamType.String,
          false,
        ),
        categoryDescription: convertAlgoliaParam(
          data['categoryDescription'],
          ParamType.String,
          false,
        ),
        categoryImage: convertAlgoliaParam(
          data['categoryImage'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriesStruct &&
        categoryName == other.categoryName &&
        categoryDescription == other.categoryDescription &&
        categoryImage == other.categoryImage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([categoryName, categoryDescription, categoryImage]);
}

CategoriesStruct createCategoriesStruct({
  String? categoryName,
  String? categoryDescription,
  String? categoryImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriesStruct(
      categoryName: categoryName,
      categoryDescription: categoryDescription,
      categoryImage: categoryImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriesStruct? updateCategoriesStruct(
  CategoriesStruct? categories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriesStructData(
  Map<String, dynamic> firestoreData,
  CategoriesStruct? categories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categories == null) {
    return;
  }
  if (categories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriesData = getCategoriesFirestoreData(categories, forFieldValue);
  final nestedData = categoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriesFirestoreData(
  CategoriesStruct? categories, [
  bool forFieldValue = false,
]) {
  if (categories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categories.toMap());

  // Add any Firestore field values
  categories.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriesListFirestoreData(
  List<CategoriesStruct>? categoriess,
) =>
    categoriess?.map((e) => getCategoriesFirestoreData(e, true)).toList() ?? [];
