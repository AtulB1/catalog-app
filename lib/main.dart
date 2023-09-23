// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/utils/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: mystore(), child: Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: home_page(),
      themeMode: ThemeMode.system,
      theme: Mytheme.lighttheme(context),
      darkTheme: Mytheme.darktheme(context),

      debugShowCheckedModeBanner: false,

      initialRoute: Myroutes.homeroute,
      routes: {
        "/": (context) => LoginPage(),
        Myroutes.homeroute: (context) => home_page(),
        Myroutes.loginroute: (context) => LoginPage(),
        Myroutes.cartroute: (context) => Cartpage(),
      },
    );
  }
}
