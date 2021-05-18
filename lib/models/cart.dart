import 'package:flutter1/models/catalog.dart';
import 'catalog.dart';

class CartModel {
  // SingletonClass
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // catalog field
  CatalogModel _catalog;
  // Collection of ID's
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  // Get totalPrice
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

// Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
