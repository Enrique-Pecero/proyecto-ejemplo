import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/HomeLabsol.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/config.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/perfil.dart';



class MenuLabsolColaboradores extends StatefulWidget {
    @override
  _MenuLabsolColaboradoresState createState() => _MenuLabsolColaboradoresState();
}

class _MenuLabsolColaboradoresState extends State<MenuLabsolColaboradores> {
  @override
  Widget build(BuildContext context) {
    return  BottonNavBar();// *Estoy llamando la clase que se creo
  }
}

class BottonNavBar extends StatefulWidget {
  @override
  _BottonNavBarState createState() => _BottonNavBarState();
}
 
class _BottonNavBarState extends State<BottonNavBar> {
  int pageIndex = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  //*Para llamar a las paginas que se mostraran
  final LabsolLogged _home = LabsolLogged();
  final Perfil _perfil = Perfil();
  final Configuraciones _config = Configuraciones();

  Widget _showPage = new LabsolLogged();
  Widget _pageChooser(int page){
    //*Faltan las demas paginas por introducir para mostrar

    switch(page){
      case 0:
      return _home;
      break;
      case 1:
      return _perfil;
      break;
      case 2:
      return _config;
      break;
      default:
      return new Container(
        child: new Center(
          child: Text('No page found by page chooser'),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
         // initialIndex: 0,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white,),
            // Icon(Icons.add, size: 30),
            Icon(Icons.perm_identity, size: 30,color: Colors.white),
            // Icon(Icons.settings, size: 30),
            Icon(Icons.settings, size: 30, color: Colors.white,),
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
        body: 
        Container(
          color: Colors.white,
          child: _showPage,

          ),

        );
  }
}


