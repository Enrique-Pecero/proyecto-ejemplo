import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:labsol/src/ui/pisos/labsol/invitados/menu_labsol_invitados.dart';


class Configuraciones extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: ElasticIn(
          delay: Duration(milliseconds: 300),
          child: Text('Configuraciones'),
        ),
      ),
      
      
      body:Container(
        
        child: ListView(
          
            children: <Widget>[
              
              //body
              
              InkWell(
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => perfil()));
                  },
                  child: ListTile(
                    title: Text('Opcion 1...'),
                    leading: Icon(Icons.insert_emoticon),
                  )),
              InkWell(
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => config()));
                  },
                  child: ListTile(
                    title: Text('Opcion 2...'),
                    leading: Icon(Icons.insert_emoticon, color: Colors.black),
                  )
                  ),    
              InkWell(
                  onTap: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => AcercaDePhoton())
                    // );
                  },
                  splashColor: Colors.blue,
                  child: ListTile(
                    title: Text('Opcion 3...'),
                    leading: Icon(Icons.insert_emoticon, color: Colors.black,),

                  )
              ),
              OutlineButton.icon(
                icon: Icon(Icons.exit_to_app, color: Colors.black,),
                label: Text('Cerrar Sesión'),
                
                // _CerrarSesionMaterial,
                onPressed: ()=> {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      elevation:24.0,
                      backgroundColor: Colors.white,
                      title: Text("¿Decea cerrar sesion en Labsol?"),
                      content: Text("Seleccione una opcion"),
                      actions: <Widget>[
                        FlatButton(
                         child: Text("No"),
                         onPressed: ()=>Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text("Yes"),
                          onPressed: (){
                           Navigator.pop(context, "Yes");
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => MenuLabsol()),
                          );
                          },
                        )
                      ], 
                    )   
                  )
                },
                shape: StadiumBorder(),
                highlightColor: Colors.blue,
              ),
            ],
            padding: EdgeInsets.zero,
          ),
      ),
    );
  }
}