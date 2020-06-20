import 'package:flutter/material.dart';

class AboutAppPhoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: (){
            showAboutDialog(
              context: context,
              // applicationVersion: appVersion,
              applicationIcon: FlutterLogo(),
              applicationLegalese: 'Esta aplicacion puede ser utilizada por todo el publico.',
              children: [
                Padding(
                  padding:const EdgeInsets.only(top: 16),
                  child: Text('Texto sobre la app de photon...'),
                  ),
              ],
            );
          },
          child: Text('show about dialog'),
        )
      ),
    );
  }
}