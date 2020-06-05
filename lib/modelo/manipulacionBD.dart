
import 'package:drawer_app/modelo/bitacora.dart';
import 'package:drawer_app/modelo/definicionBD.dart';
import 'package:sqflite/sqflite.dart';


//Esta clase toma la conexión creada en la clase de DefinicionBD para insertar y recuperar datos
class ManipulacionBD {

  final dbProvider = DefinicionBD.dbProvider;

  void cargarDatos() async {
    //Esta sección debe ser sustituida por un formulario. Practiquen creando uno propio con ayuda de los tutoriales de Flutter, checa
    // https://flutter.dev/docs/cookbook/forms/validation
    var vuelo1 = bitacora(fecha: '11/02/2019',
        actividad: 'Phantom 4 pro',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo2 = bitacora(fecha: '12/02/2019',
        actividad: 'Mavic pro',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo3 = bitacora(fecha: '13/02/2019',
        actividad: 'Spark',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo4 = bitacora(fecha: '14/02/2019',
        actividad: 'Matrice 600 pro',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo5 = bitacora(fecha: '15/02/2019',
        actividad: 'Mavic 2',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo6 = bitacora(fecha: '16/02/2019',
        actividad: 'Mini Mavic',
        detalles: 'Vuelo sin contratiempos de BD');
    var vuelo7 = bitacora(fecha: '17/02/2019',
        actividad: 'Inspire',
        detalles: 'Vuelo sin contratiempos de BD');
    //Inserta registros a la tabla
    await insertVuelo(vuelo1);
    await insertVuelo(vuelo2);
    await insertVuelo(vuelo3);
    await insertVuelo(vuelo4);
    await insertVuelo(vuelo5);
    await insertVuelo(vuelo6);
    await insertVuelo(vuelo7);
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  }

  Future<void> insertVuelo(bitacora vuelo) async {
    final db = await dbProvider.database;
    // Inserta un vueo en la tabla correspondiente. También prevee
    // la repetición de registros `conflictAlgorithm`, reemplazandolos
    await db.insert(
      'vuelos',
      vuelo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<bitacora>> getVuelos() async {
    final db = await dbProvider.database;
    // Se recuperan todos los registros de la tabla.
    final List<Map<String, dynamic>> maps = await db.query('vuelos');

    // Convierte  List<Map<String, dynamic>  a List<Dog>.
    return List.generate(maps.length, (i) {
      return bitacora(
        fecha: maps[i]['fecha'],
        actividad: maps[i]['dron'],
        detalles: maps[i]['detalles'],
      );
    });
  }




}