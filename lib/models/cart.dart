import 'package:flutter1/core/store.dart';
import 'package:flutter1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'catalog.dart';

class CartModel {
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

// // Add item
//   void add(Item item) {
//     _itemIds.add(item.id);
//   }

// // Remove item
//   void remove(Item item) {
//     _itemIds.remove(item.id);
//   }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store.cart._itemIds.remove(item.id);
  }
}

