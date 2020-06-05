import 'package:drawer_app/vista/vuelosListas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  static BuildContext contexto;

  const Home({Key key}): super(key: key);

  ListTile getListItem(Icon icono, String opcion,String route){
    return ListTile(
        leading: icono,
        title: Text(opcion),
        onTap: (){
          Navigator.pushNamed(contexto, route);
      },


);

  }


  ListView getMenu(BuildContext context){

    return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
            color: Colors.green,
            ),

               child:Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/perfil.jpg'),
                        backgroundColor: Colors.white,
                        radius: 60.0,

                      ),
                    ),
                    Align(alignment: Alignment.centerRight,
                    child: Text(
                      'Samuel Leal Vega',
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ) ,
                    ),
                    ],
                )
               ),

        getListItem(Icon(Icons.content_paste),"Actividades Listas","/"),
        getListItem(Icon(Icons.view_list),"Actividades Sqlite","/vuelosBD"),
        getListItem(Icon(Icons.web),"Actividades WebService","/vuelosWeb"),

      ],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    contexto = context;

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina principal"),
      ),
      drawer: Drawer(
          child: getMenu(context),
      ),
      body: VuelosListas(),

    );
  }
}