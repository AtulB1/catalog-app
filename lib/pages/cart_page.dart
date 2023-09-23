import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_models.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: "CART".text.color(context.primaryColor).make().expand(),
      ),
      body: Column(children: [
        _cartList().p32().expand(),
        Divider(),
        _cartTotal(),
      ]),
    );
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, dynamic, VxStatus) {
              return "\$${_cart.totalPrice}".text.xl5.make();
            },
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.primaryColor)),
            child: "Buy".text.xl2.make(),
          ).w24(context)
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final cartItems = _cart.items;

    if (cartItems.isEmpty) {
      return Center(
        child: "No items in the cart.".text.make(),
      );
    }

    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            RemoveMutation(_cart.items[index]);
          },
          icon: Icon(Icons.remove),
        ),
        title: cartItems[index].name.text.make(),
      ),
    );
  }
}
