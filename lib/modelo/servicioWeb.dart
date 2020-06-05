//import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:drawer_app/modelo/bitacora.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ServWeb {

   Future<List<bitacora>> fetchVuelos() async {
    final response =
    await http.get('http://192.168.0.9/webflutter/bitacoravuelos.php');
    // await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      //print(response.body);
      return compute(parseVuelos, response.body);
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Failed to load post');
    }
  }

   static List<bitacora> parseVuelos(String responseBody) {
    print(responseBody);
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<bitacora>((json) => bitacora.fromJson(json)).toList();
  }

}