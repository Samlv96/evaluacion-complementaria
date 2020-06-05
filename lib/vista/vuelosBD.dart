import 'package:drawer_app/modelo/bitacora.dart';
import 'package:drawer_app/modelo/elementoLista.dart';
import 'package:drawer_app/modelo/manipulacionBD.dart';
import 'package:flutter/material.dart';


class VuelosBD extends StatelessWidget {
  static String routeName = "/vuelosBD";
  final ManipulacionBD bd = ManipulacionBD(); // Instancia de la clase de manipulación de datos


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {

    return Scaffold(
      appBar: AppBar(
        title: Text("Vuelos Sqlite"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<bitacora>>( //El widget FutureBuldire permite construir widgets a partir de Futuros<>
            future: bd.getVuelos(), // Lista de todos de los registros extraidos de la tabla vuelos en formato map
            builder: (BuildContext context, AsyncSnapshot<List<bitacora>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = snapshot.data // Lista de los registros extraidos de la tabla vuelos convertidos en formato List<ListItem>
                    .map((bitacora) => ListItem(registro: bitacora))
                    .toList();
              } else if (snapshot.hasError) {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                children = <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ];
              }
              return ListView(
                children: children,
              );
            }
          ),

        ),
      ),
      
    );
  }
}