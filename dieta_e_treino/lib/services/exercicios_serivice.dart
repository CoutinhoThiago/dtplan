import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ExerciseService {
  final String apiUrl = "http://localhost:8080/exercicios";

  Future<http.Response> postExercise(Map<String, dynamic> exerciseData) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(exerciseData),
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Erro ao enviar os dados do exercício');
      }
    } on SocketException catch (e) {
      // Trate exceções relacionadas à conexão aqui
      throw Exception('Erro de conexão: $e');
    } on http.ClientException catch (e) {
      // Trate exceções relacionadas ao cliente aqui
      throw Exception('Erro do cliente: $e');
    } catch (e) {
      // Trate outras exceções aqui
      throw Exception('Erro desconhecido: $e');
    }
  }
}