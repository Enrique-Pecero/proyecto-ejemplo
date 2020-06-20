import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:labsol/src/model/servicio.dart';


class Solicitar extends StatefulWidget {
  
  final Servicios servicios;
  Solicitar(this.servicios);

  @override
  _SolicitarState createState() => _SolicitarState();
}

final serviciosReference = FirebaseDatabase.instance.reference().child('servicios');

class _SolicitarState extends State<Solicitar> {

  List<Servicios> items;

  TextEditingController _nameController;
  TextEditingController _actividadController;
  TextEditingController _descripcionController;
  TextEditingController _fechaController;
  TextEditingController _horaController;


    @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget.servicios.name);
    _actividadController = new TextEditingController(text: widget.servicios.actividad);
    _descripcionController = new TextEditingController(text: widget.servicios.actividad);
    _fechaController = new TextEditingController(text: widget.servicios.fecha);
    _horaController = new TextEditingController(text: widget.servicios.hora);
  }

DateTime _date  = DateTime.now();
TimeOfDay _time = TimeOfDay.now();

  Future<Null> _selectedDate() async {
    final DateTime picked =  await showDatePicker(
      context: context,
       initialDate: _date,
        firstDate: new DateTime(2016),
         lastDate: new DateTime(2022),
         );

         if(picked != null && picked != _date){
           print('Date selected: ${_date.toString()}');
           setState((){
             _date = picked ;
           });
         }
  }

  Future<Null> _selectedTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
       initialTime: _time
       );

       if(picked != null && picked != _time){
           print('Time selected: ${_time.toString()}');
           setState((){
             _time = picked ;
           });
         }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   String _formatdate = DateFormat.yMMMd().format(_date);

    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Solicitar...')
      ),
      
      body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 24.0),
          TextFormField(
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              labelText: 'Nombre del o los responsable',
            ),
            maxLines: 2,
            onSaved: (String value) {
            },
            
          ),
          SizedBox(height: 24.0),
          TextFormField(      
            controller: _actividadController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.local_activity),
               hintText: 'Escriba que actividad realizara',
              labelText: 'Actividad a realizar',
            ),
            maxLines: 2,
            onSaved: (String value) {
              
            },
            
          ),        
          SizedBox(height: 24.0),
          TextFormField(
            
            controller: _descripcionController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Describe en breve de que trata la actividad',
              // helperText: 'Keep it short, this is just a demo.',
              labelText: 'Descripcion',
            ),
            maxLines: 3,
          ),
          SizedBox(height: 24.0),
          RaisedButton(
            color: Colors.blue,
            child: Text('Selecciona la fecha'),
            onPressed: (){
              
              _selectedDate();}
            ),
          TextFormField(
              enabled: false,            
              controller: _fechaController,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
              border: UnderlineInputBorder(),
              //filled: true,
              icon: Icon(Icons.calendar_today),
               hintText: 'Fecha: ${_formatdate.toString()}',
              //  labelText: 'Fecha:  ${_formatdate.toString()}',
            ),
            maxLines: 1,
            onSaved: (String value) {
            },
            
          ),
          SizedBox(height: 28.0),
          RaisedButton(
            color: Colors.green[200],
            child: Text('Selecciona la hora'),
            onPressed: (){_selectedTime(context);}
            ),
          TextFormField(
              controller: _horaController,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              // filled: true,
              icon: Icon(Icons.calendar_today),
               hintText: '${_time.toString()}',
              //labelText: ' ${_time.toString()}',
            ),
            maxLines: 1,
            onSaved: (String value) {             
            },  
          ),
          SizedBox(height: 50.0),
          Container(
             padding: EdgeInsets.only( bottom: 10, right: 5, left: 5),
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
                          color: Colors.red,
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                            
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
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          color: Colors.green,
                          shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          onPressed: () {
                    if (widget.servicios.id != null) {
                      serviciosReference.child(widget.servicios.id).set({
                        'name': _nameController.text,
                          'actividad': _actividadController.text,
                          'descripcion': _descripcionController.text,
                          'fecha':  '${_formatdate.toString()}',
                          'hora': '${_time.toString()}',
                      });
                    }
                    else {
                      serviciosReference.push().set({
                        'name': _nameController.text,
                          'actividad': _actividadController.text,
                          'descripcion': _descripcionController.text,
                          'fecha': ' ${_formatdate.toString()}',
                          'hora': '${_time.toString()}',
                      }).then((_) {
                          Navigator.pop(context);
                        });
                    }
                    if(_formKey.currentState.validate()){
                Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
                  },
                  
                          
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Center(
                              child: (widget.servicios.id != null)
                                ? Text('Update', style: TextStyle(fontSize: 14, color: Colors.white),)
                                : Text('Add', style: TextStyle(fontSize: 14, color: Colors.white),),
                                
                            ),
                            // child: Center(
                            //   child: Text("Enviar",
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //           fontSize: 14, color: Colors.white)),
                            // ),
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
    ),
    );    
  }
}

