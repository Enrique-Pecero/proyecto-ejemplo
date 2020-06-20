import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labsol/src/ui/photon/configuraciones.dart';
import 'package:labsol/src/bloc/authentication_bloc/bloc.dart';
import 'package:labsol/src/ui/photon/quienes_somos.dart';
import 'package:labsol/src/ui/pisos/labsol/invitados/menu_labsol_invitados.dart';

class HomePage extends StatelessWidget {
  final String name;

  HomePage({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 220.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/edificio_photon.png'),
          AssetImage('assets/edificio_photon_2.png'),
          AssetImage('assets/labsol.png'),
          AssetImage('assets/bannerLogo.png'),
          AssetImage('assets/labsol_entrada.png'),
        ],
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: Text('Photon'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Image.asset(
                'assets/edificio_photon.png',
              ),
            ),
            InkWell(
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) => Perfil()));
                },
                child: ListTile(
                  title: Text('Mi cuenta'),
                  leading: Icon(Icons.person),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Config()));
                },
                child: ListTile(
                  title: Text('Configuraciones'),
                  leading: Icon(Icons.settings, color: Colors.black),
                )),
            InkWell(
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Photon Innovation Hub',
                    applicationVersion: '1.0',
                    applicationIcon: FlutterLogo(),
                    applicationLegalese:
                        'Esta aplicacion puede ser utilizada por todo el publico.',
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Texto sobre la app de photon...'),
                      ),
                    ],
                  );
                },
                child: ListTile(
                  title: Text('Acerca de'),
                  leading: Icon(
                    Icons.announcement,
                    color: Colors.black,
                  ),
                )),
            OutlineButton.icon(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              label: Text('Cerrar Sesión'),
              // _CerrarSesionMaterial,
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          elevation: 24.0,
                          backgroundColor: Colors.white,
                          title: Text("¿Decea cerrar sesion?"),
                          content: Text("Seleccione una opcion"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("No"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            FlatButton(
                              child: Text("Yes"),
                              onPressed: () {
                                Navigator.pop(context, "Yes");
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(LoggedOut());
                              },
                            )
                          ],
                        ))
              },
              shape: StadiumBorder(),
              highlightColor: Colors.blue,
            ),
          ],
          padding: EdgeInsets.zero,
        ),
      ),
      body: MenuEmpresas(imageCarousel: imageCarousel),
    );
  }
}

class MenuEmpresas extends StatelessWidget {
  const MenuEmpresas({
    Key key,
    @required this.imageCarousel,
  }) : super(key: key);

  final Widget imageCarousel;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        imageCarousel,
        Container(
          padding: EdgeInsets.only(top: 70, bottom: 10, right: 5, left: 5),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.blueGrey[500],
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuienesSomosPhoton()),
                            );
                          },
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: Text("Acerca de Photon",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.blueGrey[500],
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MenuLabsol()),
                            );
                          },
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: Text("Labsol",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Aqui seguiran las columnas para las demas empresas o departamentos
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.blueGrey[500],
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {},
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: Text("Empresa 2",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.blueGrey[500],
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {},
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Center(
                              child: Text("Empresa 3",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
