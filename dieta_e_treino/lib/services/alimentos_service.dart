// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
//
// class AlimentosService {
//   Future<List<Map<String, dynamic>>> obterAlimentosCadastrados() async {
//     String data = await rootBundle.loadString('assets/alimentos_data.json');
//     List<dynamic> jsonResult = json.decode(data);
//     return List<Map<String, dynamic>>.from(jsonResult);
//   }
// }

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AlimentosService {
  Future<List<Map<String, dynamic>>> obterAlimentosCadastrados() async {
    final data = await rootBundle.loadString('assets/alimentos_data.json');
    final List<dynamic> jsonResult = json.decode(data);

    return List<Map<String, dynamic>>.from(jsonResult);
  }
}
