import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/core/store.dart';
import 'package:flutter1/models/cart.dart';
import 'package:flutter1/models/catalog.dart';
import 'package:flutter1/pages/home_details_page.dart';
import 'package:flutter1/untils/routes.dart';
import 'package:flutter1/widgets/theam.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter1/home_widgets/add_to_cart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJSON();
  }

  loadJSON() async {
    await Future.delayed(Duration(seconds: 2));
    // final json =
    //     await rootBundle.loadString("assets/images/files/localcatalog.json");
    final json = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(json.body);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheam.offWhite,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand()
            ],
          ),
        ),
      ),
      // drawer: MyDrawer(),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (Image.network(
      image,
    )
        .box
        .rounded
        .p8
        .color(MyTheam.offWhite)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: context.isMobile ? 40 : 20));
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key, key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalog.name.text.lg.color(MyTheam.deepPurple).make(),
          catalog.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl.color(MyTheam.deepPurple).make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 8.0)
        ],
      ).p(context.isMobile ? 0 : 16)),
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(children: children2))
        .white
        .rounded
        .square(150)
        .make()
        .py16();
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailsPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailsPage(
                                catalog: catalog,
                              ))),
                  child: CatalogItem(catalog: catalog));
            },
          );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheam.deepPurple).make(),
        "Treding Products".text.xl.make(),
      ],
    );
  }
}
