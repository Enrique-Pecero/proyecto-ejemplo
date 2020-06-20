import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:labsol/src/ui/pisos/labsol/colaboradores/servicio_screen.dart';
import 'dart:async';
import 'package:labsol/src/model/servicio.dart';
import 'package:labsol/src/ui/pisos/labsol/colaboradores/servicios/update_servicios.dart';

class ListViewservicio extends StatefulWidget {
  @override
  _ListViewservicioState createState() => _ListViewservicioState();
}

final servicioReference = FirebaseDatabase.instance.reference().child('servicios');

class _ListViewservicioState extends State<ListViewservicio> {

  List<Servicios> items;
  StreamSubscription<Event> _onservicioAddedSubscription;
  StreamSubscription<Event> _onservicioChangedSubscription;

  @override
  void initState() {
    super.initState();
    items = List();
    _onservicioAddedSubscription = servicioReference.onChildAdded.listen(_onservicioAdded);
    _onservicioChangedSubscription = servicioReference.onChildChanged.listen(_onservicioUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onservicioAddedSubscription.cancel();
    _onservicioChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de servicios solicitados'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,         
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 3.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),                    
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(                      
                        child: Row(
                          children: <Widget>[
                            
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${items[position].name}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${items[position].descripcion}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  onTap: () => _navigateToServicioInformation(
                                      context, items[position])),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _showDialog(context, position),
                                ),
                                
                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blueAccent,
                                ),
                                onPressed: () =>
                                    _navigateToServicio(context, items[position])),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.blueGrey[500],
                ),
                onPressed: () =>
                  _deleteservicio(context, items[position], position,),                                        
                    ),                   
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onservicioAdded(Event event) {
    setState(() {
      items.add(new Servicios.fromSnapShot(event.snapshot));
    });
  }

  void _onservicioUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Servicios.fromSnapShot(event.snapshot);
    });
  }

  void _deleteservicio(
      BuildContext context, Servicios servicio, int position) async {
    await servicioReference.child(servicio.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navigateToServicioInformation(
      BuildContext context, Servicios servicios) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateServicios(servicios)),
    );
  }

  void _navigateToServicio(BuildContext context, Servicios servicios) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateServicios(servicios)),
    );
  }

  // void _createNewServicio(BuildContext context) async {
  //   await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) =>
  //             ServicioScreen(Servicios(null, '', '', '', "", ""))),
  //   );
  // }

  
}