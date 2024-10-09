import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _phoneNumber = '+23276828541';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  List<CartItemTypeStruct> _cart = [];
  List<CartItemTypeStruct> get cart => _cart;
  set cart(List<CartItemTypeStruct> value) {
    _cart = value;
  }

  void addToCart(CartItemTypeStruct value) {
    cart.add(value);
  }

  void removeFromCart(CartItemTypeStruct value) {
    cart.remove(value);
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
  }

  void updateCartAtIndex(
    int index,
    CartItemTypeStruct Function(CartItemTypeStruct) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
  }

  void insertAtIndexInCart(int index, CartItemTypeStruct value) {
    cart.insert(index, value);
  }

  double _cartSum = 0.0;
  double get cartSum => _cartSum;
  set cartSum(double value) {
    _cartSum = value;
  }

  String _menuActiveItem = 'Home';
  String get menuActiveItem => _menuActiveItem;
  set menuActiveItem(String value) {
    _menuActiveItem = value;
  }

  List<String> _menuItems = [
    'Home',
    'Explore',
    'Delivery',
    'Activity',
    'Profile'
  ];
  List<String> get menuItems => _menuItems;
  set menuItems(List<String> value) {
    _menuItems = value;
  }

  void addToMenuItems(String value) {
    menuItems.add(value);
  }

  void removeFromMenuItems(String value) {
    menuItems.remove(value);
  }

  void removeAtIndexFromMenuItems(int index) {
    menuItems.removeAt(index);
  }

  void updateMenuItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    menuItems[index] = updateFn(_menuItems[index]);
  }

  void insertAtIndexInMenuItems(int index, String value) {
    menuItems.insert(index, value);
  }

  List<CategoriesStruct> _categ = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Sandwich\",\"categoryDescription\":\"Layered fillings between fresh, toasted bread.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/UMvnk6bc3hZ2r46o8fgMWd2y5rm59OKHgTq3BzzxRT5UIpKf_vtTHYqZRXhMdlbj093wqofV3zt1KLbkP4ciXg6zvr9Vq1wPl5dxL0ws9kE\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Pizza\",\"categoryDescription\":\"Savor classic and creative Italian slices.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/YvQTb0a97W8t-9cHmkZ6jGyJUkuF8iXc3_34sOGxboeyGqgxiUhx82acil9FMRhs093wqofV3zt1KLbkP4ciXg6zvr9Vq1wPl5dxL0ws9kE\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Pasta\",\"categoryDescription\":\"Twirl into rich and comforting flavors.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/4_jl9QXHc5RaMjs8Ez1MENHpkHvq9hZTLBpdq862XZgljl6uuhH5zd5oj6AcsDqF093wqofV3zt1KLbkP4ciXg6zvr9Vq1wPl5dxL0ws9kE\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Noodles\",\"categoryDescription\":\"Slurp-worthy, savory comfort bowls.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/Emge2YxfM9EIY4cD4MDd4VI5QQF2neJXy-AgG_qnlqQfoLDsbR8Z6R4B_VQX9kdyQYAxeJspQJtDrXIT3s8D7pBop1nO34SKAZZAbjMh7wY\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Bread\",\"categoryDescription\":\"Warm, flaky, and perfect for dipping.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/xK42j7WC5uHf0aDBvdHfZL89FmI0_clTSz7ZzkLbgd_AZEEB0-R3iEtpPBK8slkvQYAxeJspQJtDrXIT3s8D7vIcsf3jI5CWqJGjDWOoqlI\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Sushi\",\"categoryDescription\":\"Artful bites of freshness.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/XQ0fZ0gmwoTFm2ojWgZFvpjdJNCOWybD_bHPpsx-6Pn0ETr3ooU5SO8R7_MQUqZDl8h8nuhOFAlN8bF5srhd-R9tQl_9NQgHO5ptxanOvRI\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Rice Dishes\",\"categoryDescription\":\"Fluffy rice meets flavorful toppings.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/s2EqGaanAlCBOrQYHYLgaYRQ6O96PcV56S8V2GAbGPKrZoysP59YEFBN5yW6MDHPl8h8nuhOFAlN8bF5srhd-aRUnqoOIpAbdxiZ2onnBlU\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"BBQ\",\"categoryDescription\":\"Smoky, slow-cooked perfection.\",\"categoryImage\":\"https://firebasestorage.googleapis.com/v0/b/sendme-e4670.appspot.com/o/barbecue_10848927.svg?alt=media&token=2096721b-324c-47fa-926f-f860b602ae11\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Salads\",\"categoryDescription\":\"Fresh, crisp, and vibrant.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/1lq52WiVfc123PapyEfE3DnJz9ui-pthsm_SUz85A1BmspynpCjTB1OQcewDOrqel8h8nuhOFAlN8bF5srhd-ZQlOgHa7ktjoN95T8zPeXA\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"category_name\":\"Seafood\",\"categoryDescription\":\"Fresh catches, Mediterranean style.\",\"categoryImage\":\"https://pouch.jumpshare.com/preview/mJwYkiPe6hyZlBchSarTVLde2qTj8X2iBYTvxZG04pyEL_yqeNh3y24Jnnc2wyVdl8h8nuhOFAlN8bF5srhd-aBPyILTCSV7h8axZIyNUyY\"}'))
  ];
  List<CategoriesStruct> get categ => _categ;
  set categ(List<CategoriesStruct> value) {
    _categ = value;
  }

  void addToCateg(CategoriesStruct value) {
    categ.add(value);
  }

  void removeFromCateg(CategoriesStruct value) {
    categ.remove(value);
  }

  void removeAtIndexFromCateg(int index) {
    categ.removeAt(index);
  }

  void updateCategAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    categ[index] = updateFn(_categ[index]);
  }

  void insertAtIndexInCateg(int index, CategoriesStruct value) {
    categ.insert(index, value);
  }

  String _homeSearchState = 'Off';
  String get homeSearchState => _homeSearchState;
  set homeSearchState(String value) {
    _homeSearchState = value;
  }
}
