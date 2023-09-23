import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class catalogImage extends StatelessWidget {
  const catalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .width(130)
        .p8
        .rounded
        .color(context.canvasColor)
        .make()
        .p(15);
  }
}