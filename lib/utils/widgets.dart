import 'package:flutter/material.dart';

class DefaultWidgets {
  AppBar createDefaultAppBar(snapshot) {
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
}
