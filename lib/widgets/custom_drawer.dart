import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 8,
                        left: 0,
                        child: Text(
                          "Flutters's\nClothing",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Positioned(
                        left: 0,
                        bottom: 0,
                        child: ScopedModelDescendant<UserModel>(
                            builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Olá, ${!model.isLoggedIn() ? "" : model.userData['name']}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  !model.isLoggedIn()
                                      ? "Entre ou cadastre-se >"
                                      : "Sair",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  if (!model.isLoggedIn()) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }
                                  model.singOut();
                                },
                              )
                            ],
                          );
                        }))
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.list, "Produtos", pageController, 1),
              DrawerTile(Icons.location_on, "Loja", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
              ScopedModelDescendant<UserModel>(builder: (context, child, user) {
                if (user.isLoggedIn() && user.userData['admin']) {
                  return DrawerTile(
                      Icons.settings, "Gerenciar Loja", pageController, 4);
                }
                return Container();
              })
            ],
          )
        ],
      ),
    );
  }
}
