import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:labsol/src/model/servicio.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/servicios/list_servicios.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/servicios/screen_salas.dart';



class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: ElasticIn(
          delay: Duration(milliseconds: 300),
          child: Text('Profile'),
        ),
      ),
      body: ContenedorPerfil(), //ImagenNet: ImagenNet
    );
  }
}

class ContenedorPerfil extends StatelessWidget {
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
                color: Colors.grey[350],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                )),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          height: 120,
                          child: Align(
                              child: FloatingActionButton(
                            backgroundColor: Colors.blueGrey[500],
                            heroTag: null,
                            child: Icon(Icons.event),
                            tooltip: 'Calendario',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListViewservicio()),
                              );
                            },
                          )),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 35, right: 35, top: 50),
                            height: 120,
                            child: Align(
                              child: Text("Nombre de usuario"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          height: 120,
                          child: Align(
                              child: FloatingActionButton(
                            backgroundColor: Colors.blueGrey[500],
                            heroTag: null,
                            child: Icon(Icons.message),
                            tooltip: 'messenger',
                            onPressed: () {},
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                                    builder: (context) => Solicitar(Servicios(null, '', '', '', '', ''))),
                              );
                            },
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: Text("Solicitar ...",
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
