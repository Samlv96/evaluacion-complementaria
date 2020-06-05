import 'package:drawer_app/modelo/bitacora.dart';
import 'package:drawer_app/modelo/elementoLista.dart';
import 'package:drawer_app/modelo/servicioWeb.dart';
import 'package:flutter/material.dart';


class VuelosWeb extends StatelessWidget {
  static String routeName = "/vuelosWeb";
  final ServWeb datosWeb = ServWeb(); // Instancia de la clase para acceso http


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
              future: datosWeb.fetchVuelos(), // Lista de todos de los registros extraidos del servicio web en formato map
              builder: (BuildContext context, AsyncSnapshot<List<bitacora>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = snapshot.data // Lista de los registros extraidos del servicio web convertidos en formato List<ListItem>
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