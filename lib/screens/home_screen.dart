import 'package:ecommerce/tabs/home_tab.dart';
import 'package:ecommerce/tabs/products_tab.dart';
import 'package:ecommerce/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
          ),
          drawer: CustomDrawer(pageController),
          body: ProductsTab(),
        )
      ],
    );
  }
}
