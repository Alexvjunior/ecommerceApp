import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/datas/product_data.dart';
import 'package:ecommerce/utils/widgets.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> with DefaultWidgets {
  final ProductData product;
  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: defaultAppBar(title: product.title),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: defaultCarousel(product.images, context),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  product.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                defaultPrice(product.price, context),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height: 44,
                    child: RaisedButton(
                        color: primaryColor,
                        textColor: Colors.white,
                        onPressed: product.count > 0 ? () {} : null,
                        child: Text(
                          'Adicionar ao carrinho',
                          style: TextStyle(fontSize: 18),
                        ))),
                SizedBox(height: 16),
                Text(
                  'Descriçao',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 16),
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
