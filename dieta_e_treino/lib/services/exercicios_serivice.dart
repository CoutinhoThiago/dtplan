import 'dart:io';
import 'package:dieta_e_treino/services/token_servicce.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExerciseService {
  final String apiUrl = "http://10.0.2.2:8080/exercicios";

  Future<http.Response?> postExercise(Map<String, dynamic> exerciseData) async {
    String? token = await TokenStorage().getToken();
    if (token == null) {
      throw Exception('Token expirado ou ausente. Por favor, faça o login novamente.');
    }

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(exerciseData),
      );

      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception('Erro ao enviar os dados do exercício: ${response.statusCode}');
      }
    } catch (e) {
      _handleException(e);
    }
  }

  Future<Map<String, dynamic>> getExercise() async {
    String? token = await TokenStorage().getToken();
    if (token == null) {
      throw Exception('Token expirado ou ausente. Por favor, faça o login novamente.');
    }

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Erro ao carregar os exercícios: ${response.statusCode}');
      }
    } catch (e) {
      return {}; // Retorna um mapa vazio em vez de null
    }
  }

  void _handleException(e) {
    if (e is SocketException) {
      throw Exception('Erro de conexão: $e');
    } else if (e is http.ClientException) {
      throw Exception('Erro do cliente: $e');
    } else {
      throw Exception('Erro desconhecido: $e');
    }
  }
}
