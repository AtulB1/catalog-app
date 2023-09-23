import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/homepage/addToCart.dart';
import 'package:velocity_x/velocity_x.dart';

class homeDetailpage extends StatelessWidget {
  final Item catalog;
  const homeDetailpage({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Hero(
          tag: Key(catalog.id.toString()),
          child: Column(
            children: [
              Image.network(catalog.image).h32(context).cornerRadius(40).p8(),
              Expanded(
                child: VxArc(
                  height: 25,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.bold.xl4.make(),
                        catalog.desc.text.xl2
                            .textStyle(context.captionStyle)
                            .make(),
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate"
                            .text
                            .xl
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py32(),
                  ),
                ),
              ),
              Container(
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.make(),
                    addtoCart(catalog: catalog).wh(130, 45)
                  ],
                ).p16(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
