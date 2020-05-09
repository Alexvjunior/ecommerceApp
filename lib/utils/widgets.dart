import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/singup_screen.dart';

class DefaultWidgets {
  AppBar defaultAppBar({String title = ''}) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  Carousel defaultCarousel(List list, BuildContext context) {
    return Carousel(
      images: list.map(
        (url) {
          return NetworkImage(url);
        },
      ).toList(),
      dotSize: 4,
      dotSpacing: 15,
      dotBgColor: Colors.transparent,
      dotColor: Theme.of(context).primaryColor,
      autoplay: false,
    );
  }

  Text defaultPrice(double price, BuildContext context) {
    return Text(
      "R\$ ${price.toStringAsFixed(2)}",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

}
