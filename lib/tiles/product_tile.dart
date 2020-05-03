import 'package:ecommerce/datas/product_data.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/utils/widgets.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget with DefaultWidgets {
  final String type;
  final ProductData productData;

  ProductTile(this.type, this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductScreen(productData)));
      },
      child: Card(
        child: _craeteColumnOrRow(context),
      ),
    );
  }

  Widget _craeteColumnOrRow(BuildContext context) {
    if (type == 'grid') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.8,
            child: Image.network(
              productData.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Text('${productData.title} \(${productData.count}\)',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                defaultPrice(productData.price, context),
              ],
            ),
          )),
        ],
      );
    }

    return Row(
      children: <Widget>[
        Flexible(
            flex: 1,
            child: Image.network(
              productData.images[0],
              fit: BoxFit.cover,
              height: 250,
            )),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${productData.title} \(${productData.count}\)',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                Text(
                  'R\$ ${productData.price.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
