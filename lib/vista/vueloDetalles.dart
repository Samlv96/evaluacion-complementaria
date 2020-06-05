
import 'package:drawer_app/modelo/bitacora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VueloDetalles extends StatelessWidget {
  final bitacora vuelo;

  VueloDetalles({this.vuelo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades descripción"),
      ),
      body: Center(

          child: Column(

          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(20.0),
              color: Colors.lightGreenAccent,
              child: Text('Nombre de la actividad ' + '\n' + vuelo.actividad,
                style: TextStyle(color: Colors.black, fontSize: 30, ),
              )
            ),
            Card(
                margin: const EdgeInsets.all(20.0),
                color: Colors.lightGreenAccent,
                child: Text('Fecha de revision: ' + vuelo.fecha,
                  style: TextStyle(color: Colors.black, fontSize: 20, ),
                )
            ),
            Card(
                margin: const EdgeInsets.all(20.0),
                color: Colors.lightGreenAccent,
                child: Text('Detalles de la actividad: ' + vuelo.detalles,
                  style: TextStyle(color: Colors.black, fontSize: 20, ),
                )
            ),
            RaisedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: Text('Regresar'),
            ),
          ],

        )


      ),
    );
  }
}