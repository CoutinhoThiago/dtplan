import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  // URL de login
  static const String loginUrl = 'http://10.0.2.2:8080/login';

  // Função para fazer login
  Future<String> login(String login, String senha) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'login': login, 'senha': senha}),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String token = data['token']; // Supondo que a API retorne um campo 'token'
        print(token);
        return token;
      } else {
        // Trata erros de resposta da API
        throw Exception('Erro de login: ${response.body}');
      }
    } catch (e) {
      // Trata exceções de rede, etc.
      throw Exception('Erro de conexão: $e');
    }
  }

// Outros métodos da classe AuthService...
}
