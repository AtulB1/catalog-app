import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/homeDetailPage.dart';
import 'package:flutter_application_1/pages/homepage/catalogItem.dart';

class catalogList extends StatelessWidget {
  const catalogList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Mymodels.items.length,
      itemBuilder: (context, index) {
        final Catalog = Mymodels.items[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => homeDetailpage(catalog: Catalog),
            ),
          ),
          child: catalogItem(catalog: Catalog),
        );
      },
    );
  }
}