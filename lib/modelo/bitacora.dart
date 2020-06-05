
class bitacora{
  final String fecha;
  final String actividad;
  final String detalles;

  bitacora({this.fecha,this.actividad, this.detalles});


  /* Se crea el metodo toMap para transformar los datos de un formato de objeto
  a mapa. Este es necesario para introducir registros a la base de datos.
   */
  Map<String, dynamic> toMap() {
    return {
      'fecha': fecha,
      'dron': actividad,
      'detalles': detalles,
    };
  }

  factory bitacora.fromJson(Map<String, dynamic> json) {
    return bitacora(
      fecha: json['fecha'],
      actividad: json['dron'],
      detalles: json['detalles'],

    );
  }


}
