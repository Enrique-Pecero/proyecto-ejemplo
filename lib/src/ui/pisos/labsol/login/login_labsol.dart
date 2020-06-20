import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginLabsol extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElasticIn(
          delay: Duration(milliseconds: 300),
          child: Text('Inicio de sesion en labsol'), 
        ),
      ),
      body: Formulario(),
    );
  }
}

class Formulario extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.only(top: 150, bottom: 25, right: 5, left: 5),
      
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              // hintText: 'What do people call you?',
              labelText: 'Usuario',
            ),
            maxLines: 1,
            onSaved: (String value) {
              
            },
            
          ),
          SizedBox(height: 24.0),
          TextFormField(
            obscureText: true,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.security),
              labelText: 'Contraseña o clave',
            ),
            maxLines: 1,
            onSaved: (String value) {
              
            },
            
          ),

          SizedBox(height: 24.0),
          

          Container(
            //  padding: EdgeInsets.only(top: 300, bottom: 10),
             child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: RaisedButton(
                          color: Colors.red,
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                             Navigator.pop(context);
                            
                          },
                          
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Center(
                              child: Text("Cancelar",
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
                        padding: EdgeInsets.all(20),
                        child: RaisedButton(
                          color: Colors.green,
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
            
                          },
                          // splashColor: Colors.green,
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Center(
                              child: Text("Entrar",
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
              
                Container(
                  child: OutlineButton(
                      child: Text('Create an Account'),
                      shape: StadiumBorder(),
                      highlightColor: Colors.blue[100],
                      onPressed: (){
                        
                      },
                    ),
                ),
              
              
            ],
          ),
          
          ),
          
        ],
      ),
    );
  }
}