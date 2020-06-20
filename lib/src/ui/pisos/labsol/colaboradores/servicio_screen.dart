import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:labsol/src/model/servicio.dart';
//nuevo para imagenes
import 'dart:io';
// import 'package:labsol/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:date_format/date_format.dart';

File image;
String filename;

class ServicioScreen extends StatefulWidget {

  final Servicios servicios;
  ServicioScreen(this.servicios);

  @override
  _ServicioScreenState createState() => _ServicioScreenState();
}

final serviciosReference = FirebaseDatabase.instance.reference().child('servicios');

class _ServicioScreenState extends State<ServicioScreen> {

  List<Servicios> items;

  TextEditingController _nameController;
  TextEditingController _actividadController;
  TextEditingController _descripcionController;
  TextEditingController _fechaController;
  TextEditingController _horaController;
  
  
  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget.servicios.name);
    _actividadController = new TextEditingController(text: widget.servicios.actividad);
    _descripcionController = new TextEditingController(text: widget.servicios.actividad);
    _fechaController = new TextEditingController(text: widget.servicios.fecha);
    _horaController = new TextEditingController(text: widget.servicios.hora);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Products'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Divider(),
                  ],
                ),
                TextField(
                  controller: _nameController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Name'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _actividadController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'actividad'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _descripcionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Description'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _fechaController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'fecha'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller: _horaController,
                  
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.shop), labelText: 'hora'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                FlatButton(
                  onPressed: (){
                    if (widget.servicios.id != null) {
                      serviciosReference.child(widget.servicios.id).set({
                        'name': _nameController.text,
                          'actividad': _actividadController.text,
                          'descripcion': _descripcionController.text,
                          'fecha': _fechaController.text,
                          'hora': _horaController.text,
                      });
                    }
                    else {
                      serviciosReference.push().set({
                        'name': _nameController.text,
                          'actividad': _actividadController.text,
                          'descripcion': _descripcionController.text,
                          'fecha': _fechaController.text,
                          'hora': _horaController.text,
                      }).then((_) {
                          Navigator.pop(context);
                        });
                    }
                  },
                  child: (widget.servicios.id != null)
                        ? Text('Update')
                        : Text('Add')
                        ),
                   
                // FlatButton(
                //     onPressed: () {
                //       //nuevo imagen
                //       if (widget.servicios.id != null) {
                        // var now = formatDate(
                        //     new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                        // var fullImageName =
                        //     '${_nameController.text}-$now' + '.jpg';
                        // var fullImageName2 =
                        //     '${_nameController.text}-$now' + '.jpg';

                        // final StorageReference ref =
                        //     FirebaseStorage.instance.ref().child(fullImageName);
                        // final StorageUploadTask task = ref.putFile(image);

                        // var part1 =
                        //     'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/';//esto cambia segun su firestore

                        // var fullPathImage = part1 + fullImageName2;

                      //   serviciosReference.child(widget.servicios.id).set({
                      //     'name': _nameController.text,
                      //     'codebar': _actividadController.text,
                      //     'description': _descripcionController.text,
                      //     'price': _fechaController.text,
                      //     'stock': _horaController.text,
                      //     // 'ProductImage': '$fullPathImage'
                      //   }).then((_) {
                      //     Navigator.pop(context);
                      //   });
                      //  } else {
                      //   //nuevo imagen
                      //   var now = formatDate(
                      //       new DateTime.now(), [yyyy, '-', mm, '-', dd]);
                      //   var fullImageName =
                      //       '${_nameController.text}-$now' + '.jpg';
                      //   var fullImageName2 =
                      //       '${_nameController.text}-$now' + '.jpg';

                      //   final StorageReference ref =
                      //       FirebaseStorage.instance.ref().child(fullImageName);
                      //   final StorageUploadTask task = ref.putFile(image);

                      //   var part1 =
                      //       'https://firebasestorage.googleapis.com/v0/b/flutterimagen.appspot.com/o/'; //esto cambia segun su firestore                           

                      //   var fullPathImage = part1 + fullImageName2;

                      //   productReference.push().set({
                      //     'name': _nameController.text,
                      //     'codebar': _codebarController.text,
                      //     'description': _descriptionController.text,
                      //     'price': _priceController.text,
                      //     'stock': _stockController.text,
                      //     'ProductImage': '$fullPathImage'//nuevo imagen
                      //   }).then((_) {
                      //     Navigator.pop(context);
                      //   });
                      // }
                    // },
                    // child: (widget.product.id != null)
                    //     ? Text('Update')
                    //     : Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}