import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/datas/product_data.dart';
import 'package:ecommerce/tiles/product_tile.dart';
import 'package:flutter/material.dart';

class ProductSceen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  ProductSceen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _createAppBar(),
        body: _createFutureBuilder(),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text(snapshot.data['title']),
      centerTitle: true,
      bottom: TabBar(
        indicatorColor: Colors.white,
        tabs: <Widget>[
          Tab(icon: Icon(Icons.grid_on)),
          Tab(icon: Icon(Icons.list)),
        ],
      ),
    );
  }

  FutureBuilder<QuerySnapshot> _createFutureBuilder() {
    return FutureBuilder(
      future: Firestore.instance
          .collection('products')
          .document(snapshot.documentID)
          .collection('items')
          .getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _createTabBarView(snapshot);
        }
      },
    );
  }

  TabBarView _createTabBarView(AsyncSnapshot<QuerySnapshot> _snapshot) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        GridView.builder(
            padding: EdgeInsets.all(4),
            itemCount: _snapshot.data.documents.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 0.65),
            itemBuilder: (context, index) {
              return ProductTile('grid',
                  ProductData.fromdocument(_snapshot.data.documents[index]));
            }),
        ListView.builder(
          padding: EdgeInsets.all(4),
          itemCount: _snapshot.data.documents.length,
          itemBuilder: (context, index) {
            return ProductTile('list',
                ProductData.fromdocument(_snapshot.data.documents[index]));
          },
        )
      ],
    );
  }
}
