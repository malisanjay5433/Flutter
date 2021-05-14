import 'package:flutter/material.dart';
import 'package:flutter1/models/catalog.dart';
import 'package:flutter1/widgets/drawer.dart';
import 'package:flutter1/widgets/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataSourceList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: dataSourceList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dataSourceList[index],
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
