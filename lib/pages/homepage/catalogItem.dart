import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/homepage/addToCart.dart';
import 'package:flutter_application_1/pages/homepage/catalogImage.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogItem extends StatelessWidget {
  final Item catalog;
  const catalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: catalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl2.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                SizedBox(
                  height: 25,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    addtoCart(catalog: catalog)
                  ],
                ).pOnly(right: 20),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py12();
  }
}

