import 'package:flutter/material.dart';



class QuienesSomosPhoton extends StatelessWidget {

 static final showCard = true;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0.1,
        title: Text('Acerca de'),
      ),
      body: Contenedor(),//_buildCard(),//Contenedor(),
    
      );
  }
}



class Contenedor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ListView(
      //padding: EdgeInsets.all(8.0),
          children: <Widget>[
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.asset('assets/edificio_photon_2.png',
                            height: 200,),
                          ),           
                ),
              ),
            ),
            Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Direccion Principal',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Zacateca, Zac.'),
              leading: Icon(
                Icons.location_on,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Numero de telefono',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('photon@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),              
          ] 
          
          
    );
  }
}