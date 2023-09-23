import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart_models.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class addtoCart extends StatelessWidget {
  final Item catalog;
  addtoCart({
    super.key,
    required this.catalog,
  });

  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? cart = (VxState.store as mystore).cart;
    bool isInCart = cart?.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
          //
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.primaryColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : "Add to cart".text.bold.make().p1(),
    );
  }
}
