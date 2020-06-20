import 'package:flutter/material.dart';


class Config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orangeAccent,
        title: Text('Photon'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Center(
            child: Text('Seccion de configuraciones...')
            )


      ),
    );
  }
}