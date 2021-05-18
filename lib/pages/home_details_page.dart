import 'package:flutter/material.dart';
import 'package:flutter1/home_widgets/add_to_cart.dart';
import 'package:flutter1/models/catalog.dart';
import 'package:flutter1/widgets/theam.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      bottomNavigationBar:
          ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
        "\$${catalog.price}"
            .text
            .bold
            .xl4
            .red500
            .color(MyTheam.deepPurple)
            .make(),
        AddToCart(
          catalog: catalog,
        ).wh(120, 50)
      ]).p32(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Container(child: Image.network(catalog.image)))
                .h32(context)
                .py16(),
            Expanded(
                child: VxArc(
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              height: 10,
              child: Container(
                color: MyTheam.offWhite,
                // color: MyTheam.darkBluishcolor,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.xl3.bold.color(MyTheam.deepPurple).make(),
                  catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  10.heightBox
                ]).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
