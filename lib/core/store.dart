import 'package:flutter_application_1/models/cart_models.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class mystore extends VxStore {
  CartModel? cart;
  Mymodels? catalog;
  mystore() {
    catalog = Mymodels();
    cart = CartModel();
    cart?.catalog = catalog!;
  }
}
