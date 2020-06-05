import 'package:drawer_app/modelo/bitacora.dart';
import 'package:drawer_app/modelo/elementoLista.dart';
import 'package:flutter/material.dart';


class VuelosListas extends StatelessWidget {

  static String routeName = "/vuelosListas";

  const VuelosListas({Key key}): super(key: key);

  List<bitacora> contruirLista() {

    var actividad1 = bitacora(fecha: '01/02/2019',actividad: 'Linea del tiempo',detalles: 'Realizar una linea del tiempo sobre los diferentes lenguajes de programación');
    var actividad2 = bitacora(fecha: '02/02/2019',actividad: 'Investigación',detalles: 'Investigar acerca de Flutter');
    var actividad3 = bitacora(fecha: '03/02/2019',actividad: 'Investigación',detalles: 'Realizar una investigacion acerca de el IDE Android Studio');
    var actividad4 = bitacora(fecha: '04/02/2019',actividad: 'Investigación',detalles: 'Realizar una investigación acerca del lenguaje Dart');
    var actividad5 = bitacora(fecha: '05/02/2019',actividad: 'Exposición',detalles: 'Realizar una exposicion sobre los sistemas operativos mas usados');
    var actividad6 = bitacora(fecha: '06/02/2019',actividad: 'Mapa conceptual',detalles: 'Realiza un mapa conceptual acerca de las bases de datos existentes');
    var actividad7 = bitacora(fecha: '07/02/2019',actividad: 'Mapa mental',detalles: 'Realiza un mapa mental acerca de de los diferentes IDE para desarrollo de aplicaciones moviles');
    var actividad8 = bitacora(fecha: '08/02/2019',actividad: 'Actividad Hola mundo',detalles: 'Crea una aplicación que muestre el mensaje Hola mundo en el centro de la pantalla');
    var actividad9 = bitacora(fecha: '09/02/2019',actividad: 'Actividad Contador',detalles: 'Modifica el tipo de letra y color de tema de la aplicacion que se crea por defecto al crear un proyecto nuevo');
    var actividad10 = bitacora(fecha:'10/02/2019',actividad: 'Actividad Calculadora',detalles: 'Crea una calculadora con operaciones básicas');
    var actividad11 = bitacora(fecha: '11/02/2019',actividad: 'Actividad Radio Buttons',detalles: 'Realiza una aplicación donde se apliquen los widgets "Radio Buttons"');
    var actividad12 = bitacora(fecha: '12/02/2019',actividad: 'Actividad Check Box',detalles: 'Realiza una aplicación donde se apliquen los widgets "Check Box"');
    var actividad13 = bitacora(fecha: '13/02/2019',actividad: 'Actividad Listas',detalles: 'Crea una aplicacion en donde apliques el widget Listas');
    var actividad14 = bitacora(fecha: '14/02/2019',actividad: 'Actividad Base de datos',detalles: 'Crea una aplicacion en donde utilices una base de datos y muestres los resultados');
    var actividad15 = bitacora(fecha: '15/02/2019',actividad: 'Actividad Contador modificado',detalles: 'Modifica la actividad Contador y ponle botones para que cuente regresivamente y inicien el 0');
    var actividad16 = bitacora(fecha: '16/02/2019',actividad: 'Actividad Responsive',detalles: 'Crea una aplicacion donde hagas uso de la propiedad "Responsive');
    var actividad17 = bitacora(fecha: '17/02/2019',actividad: 'Actividad Video',detalles: 'Crea una aplicacion en donde adjuntes un video de youtube');
    var actividad18 = bitacora(fecha: '18/02/2019',actividad: 'Actividad loggin',detalles: 'Realiza una aplicacion en donde utilices un inicio de sesion con una base de datos');
    var actividad19 = bitacora(fecha: '19/02/2019',actividad: 'Actividad Formulario',detalles: 'Crea una aplicacion en donde tenga un formulario en donde la informacion introducida se guarde en una base de datos');
    var actividad20 = bitacora(fecha: '20/02/2019',actividad: 'Entrega de actividades',detalles: 'Entregas las actividades realizadas en formato PDF y con el formato de prácticas dado en clase');

    Map<int,bitacora> mapaVuelos={
      0: actividad1,
      1: actividad2,
      2: actividad3,
      3: actividad4,
      4: actividad5,
      5: actividad6,
      6: actividad7,
      7: actividad8,
      8: actividad9,
      9: actividad10,
      10: actividad11,
      11: actividad12,
      12: actividad13,
      13: actividad14,
      14: actividad15,
      15: actividad16,
      16: actividad17,
      17: actividad18,
      18: actividad19,
      19: actividad20,
    };
    //print(mapaVuelos[1].detalles);
   return List.generate(mapaVuelos.length, (i) {
     //print('$i');
     return bitacora(

       fecha: mapaVuelos[i].fecha,
       actividad: mapaVuelos[i].actividad,
         detalles: mapaVuelos[i].detalles,
     );
   });
  }


  List<ListItem> bitacoraVuelos(){

    return contruirLista()
        .map((bitacora)=> ListItem(registro: bitacora))
        .toList();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ListView(
          children: bitacoraVuelos(),
    );


  }
}