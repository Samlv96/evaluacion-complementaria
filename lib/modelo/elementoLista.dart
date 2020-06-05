
import 'package:drawer_app/modelo/bitacora.dart';
import 'package:drawer_app/vista/vueloDetalles.dart';
import 'package:flutter/material.dart';


class ListItem extends StatelessWidget{
 // final Dog registro;
  final bitacora registro;

  ListItem({Key key,this.registro}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: CircleAvatar(child: Text(registro.actividad.substring(0, 1)),),
          title: Text(registro.actividad),
          subtitle: Text("Fecha: " + registro.fecha.toString() +"\n" + "Descripción: " + registro.detalles.toString()),

          onTap: (){

              Navigator.push(context,
                MaterialPageRoute(builder: (context) => VueloDetalles(vuelo:registro)),);

            },

        ),
      );
  }

}


