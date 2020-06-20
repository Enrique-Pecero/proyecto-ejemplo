import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:labsol/src/ui/pisos/labsol/Acerca_de_labsol.dart';

import 'package:labsol/src/ui/pisos/labsol/colaboradores/Menu_Labsol_Colaboradores.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: ElasticIn(
          delay: Duration(milliseconds: 300),
          child: Text('Home'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.input,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          elevation: 24.0,
                          backgroundColor: Colors.white,
                          title: Text("¿Iniciar sesion como colaborador?"),
                          content: Text("Seleccione una opcion"),
                          actions: <Widget>[
                            OutlineButton(
                              child: Text('Iniciar con Google'),
                              shape: StadiumBorder(),
                              highlightColor: Colors.blue[100],
                              onPressed: () {
                                Navigator.pop(context, "Yes");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MenuLabsolColaboradores()),
                                );
                              },
                            ),
                            FlatButton(
                              child: Text("Cancelar"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ));
              })
        ],
      ),
      body: Contenedor(), //ImagenNet: ImagenNet
    );
  }
}

class Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/labsolPrincipal.png'), //Es la imagen de la pagina principal
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                color: Colors.blueGrey[500],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                )),
          ),
          Divider(),
          SizedBox(height: 24.0),
          Container(
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
                                    builder: (context) => AcercaDeLabsol()),
                              );
                            },
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: Text("Acerca de Labsol",
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
                                child: Text("Opcion para una accion",
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
      ),
    );
  }
}
