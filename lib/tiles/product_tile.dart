import 'package:ecommerce/datas/product_data.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData productData;

  ProductTile(this.type, this.productData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                Text(productData.title,
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
          )),
        ],
      );
    }

    return Row();
  }
}
