import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/models/catalog.dart';
import 'package:flutter1/pages/home_details_page.dart';
import 'package:flutter1/widgets/drawer.dart';
import 'package:flutter1/widgets/item.dart';
import 'package:flutter1/widgets/theam.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJSON();
  }

  loadJSON() async {
    await Future.delayed(Duration(seconds: 2));
    final json =
        await rootBundle.loadString("assets/images/files/localcatalog.json");
    final decodedData = jsonDecode(json);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheam.offWhite,
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
    ).box.rounded.p8.color(MyTheam.offWhite).make().p16());
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key, key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
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
            ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
              "\$${catalog.price}".text.xl.color(MyTheam.deepPurple).make(),
              ElevatedButton(
                onPressed: () {},
                child: "Buy".text.make(),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheam.deepPurple),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
              )
            ]
            )
          ],
        )),
      ],
    )).white.rounded.square(150).make().py16();
  }
}

// class Catalog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
