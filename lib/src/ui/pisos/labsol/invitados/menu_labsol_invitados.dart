import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:labsol/src/ui/pisos/labsol/invitados/home.dart';

class MenuLabsol extends StatefulWidget {
  @override
  _MenuLabsolState createState() => _MenuLabsolState();
}

class _MenuLabsolState extends State<MenuLabsol> {
  @override
  Widget build(BuildContext context) {
    return BottonNavBar(); // *Se llama a la clase que se creo con nombre ButtonNavBar
  }
}

//*Clase creada
class BottonNavBar extends StatefulWidget {
  @override
  _BottonNavBarState createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  int pageIndex = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  final Home _home = Home();

  Widget _showPage = new Home();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      default:
        return new Container(
            child: new Center(
          child: Text('No page found by page chooser'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.orange,
        color: Colors.orangeAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: _showPage,
      ),
    );
  }
}
