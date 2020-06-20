
import 'package:firebase_database/firebase_database.dart';

class Servicios{
  String _id;
  String _name;
  String _actividad;
  String _descripcion;
  String _fecha;
  String _hora;

  Servicios(this._id, this._name, this._actividad, this._descripcion, this._fecha, this._hora);
   

  Servicios.map(dynamic obj){
    this._name = obj['name'];
    this._actividad = obj['actividad'];
    this._descripcion = obj['descripcion'];
    this._fecha = obj['fecha'];
    this._hora = obj['hora'];
  }

    String get id => _id;
    String get name => _name;
    String get actividad => _actividad;
    String get descripcion => _descripcion;
    String get fecha => _fecha;
    String get hora => _hora;


    Servicios.fromSnapShot (DataSnapshot snapshot){
      _id = snapshot.key;
      _name = snapshot.value['name'];
      _actividad = snapshot.value['actividad'];
      _descripcion = snapshot.value['descripcion'];
      _fecha = snapshot.value['fecha'];
      _hora = snapshot.value['hora'];
    }
}
