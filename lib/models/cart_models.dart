import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();
  factory CartModel() => cartModel;

  Mymodels? _catalog; // Use nullable Mymodels type
  final List<int> _itemIds = [];

  // Mymodels? get catalog => _catalog; // Use nullable Mymodels type

  set catalog(Mymodels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog?.getbyId(id)).whereType<Item>().toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item, {required Mymodels catalog}) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<mystore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<mystore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.remove(item.id);
  }
}
