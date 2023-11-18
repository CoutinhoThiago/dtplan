import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ExerciseService {
  final String apiUrl = "http://10.0.2.2:8080/exercicios";

  final String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJBUEkgVm9sbC5tZWQiLCJzdWIiOiJhZG1pbiIsImV4cCI6MTcwMDE4Mjg5N30.FMljhPqkzOtSL5SubneELGvCZLTCdBmOFVOSjKDHXzo";

  Future<http.Response> postExercise(Map<String, dynamic> exerciseData) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token,
        },
        body: jsonEncode(exerciseData),
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Erro ao enviar os dados do exercício: ${response.statusCode}');
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

  Future<Map<String, dynamic>> getExercise() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': token, // Adiciona o token aqui
        },
      );

      if (response.statusCode == 200) {
        // Decodifica a resposta JSON
        Map<String, dynamic> decodedResponse = json.decode(response.body);
        // Retorna toda a estrutura da página, que inclui a lista de exercícios e dados de paginação
        return decodedResponse;
      } else {
        print('Erro ao carregar os exercícios: ${response.statusCode}');
        throw Exception('Erro ao carregar os exercícios: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      throw Exception('Erro de conexão: $e');
    } on http.ClientException catch (e) {
      throw Exception('Erro do cliente: $e');
    } catch (e) {
      print('Erro desconhecido: $e');
      throw Exception('Erro desconhecido: $e');
    }
  }
}
