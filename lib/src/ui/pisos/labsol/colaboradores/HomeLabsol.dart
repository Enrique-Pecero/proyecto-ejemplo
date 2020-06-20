import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:labsol/src/ui/pisos/labsol/Acerca_de_labsol.dart';




class LabsolLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
      // final ImagenNet = 'https://lh3.googleusercontent.com/PnixgsphBLwM0FflWVMpgbKeVojtkxLw28t0cEiiZlsjWEmst2XIKZNMi7xzTJox66te_Q=s85';
    
      return  Scaffold(

        appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: ElasticIn(
          delay: Duration(milliseconds: 300),
          child: Text('Home'), 
        ),
         
      ),
        body: Contenedor(),//ImagenNet: ImagenNet
      
    ); 
  }
}

class Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return 
           Container(

        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Container(
              
               height: 250,
                decoration: BoxDecoration(
                  
                  image: DecorationImage(
                    image: AssetImage('assets/labsolPrincipal.png'),//Es la imagen de la pagina principal
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    ),
                  
                  color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(35),
                      bottomLeft: Radius.circular(35),
                     )
                  ),
            ),
            Divider(),
            SizedBox(height: 24.0),


            Container(
              //  padding: EdgeInsets.only(top: 70, bottom: 10, right: 5, left: 5),
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
                              Navigator.push(context,
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
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => MenuLabsol()),
                              // );
                            },
                            // splashColor: Colors.green,
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