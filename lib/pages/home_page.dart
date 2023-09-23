// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart_models.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/homepage/catalogList.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class home_page extends StatefulWidget {
  home_page({super.key});
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    await Duration(seconds: 2);
    var CatalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // var response = await http.get(Uri.parse(url));
    // final CatalogJson = response.body;

    var decodeddata = jsonDecode(CatalogJson);
    var productdata = decodeddata["products"];
    Mymodels.items =
        List.from(productdata).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as mystore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: context.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, Myroutes.cartroute);
          },
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            size: 18,
            color: Colors.deepOrange,
            count: _cart?.items.length,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
      ),
      
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerInfo(),
              if (Mymodels.items.isNotEmpty)
                catalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator().centered().expand(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class headerInfo extends StatelessWidget {
  const headerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catalog".text.bold.color(context.primaryColor).xl5.make(),
        "Trending Apps".text.xl2.make(),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
