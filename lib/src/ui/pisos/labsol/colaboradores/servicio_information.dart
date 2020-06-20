import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:labsol/src/model/servicio.dart';


class ServiciosInformation extends StatefulWidget {
  final Servicios servicios;
  ServiciosInformation(this.servicios);
  @override
  _ServiciosInformationState createState() => _ServiciosInformationState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ServiciosInformationState extends State<ServiciosInformation> {

  List<Servicios> items;

  String serviciosImage;//nuevo

  @override
  void initState() {   
    super.initState();
    print(serviciosImage);//nuevo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicio Information y Foto'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Name : ${widget.servicios.name}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Actividad : ${widget.servicios.actividad}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Description : ${widget.servicios.descripcion}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Fecha : ${widget.servicios.fecha}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Hora : ${widget.servicios.hora}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                Container(
                          height: 300.0,
                          width: 300.0,
              // child: Center(
              //   child: serviciosImage == ''
              //       ? Text('No Image')
              //       : Image.network(serviciosImage+'?alt=media'),//nuevo para traer la imagen de firestore
              // ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}