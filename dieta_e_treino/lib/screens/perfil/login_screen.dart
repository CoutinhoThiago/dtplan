import 'package:flutter/material.dart';
import '../../models/usuario.dart';
import '../../services/auth_service.dart';
import '../../services/token_servicce.dart';
import 'perfil_screen.dart'; // Importe sua tela de perfil aqui
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final TokenStorage _tokenStorage = TokenStorage();

  String _email = 'admin';
  String _password = '123456';

  bool _isLoading = false; // Adicione esta variável para controlar o indicador de carregamento

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() => _isLoading = true); // Ativar o indicador de carregamento

    try {
      String token = await _authService.login(_email, _password);

      if (token.isEmpty) {
        throw Exception('Token recebido é inválido.');
      }

      await _tokenStorage.saveToken(token);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PerfilScreen(usuarioNotifier: ValueNotifier<Usuario>(Usuario(nome: 'Thiago Coutinho', idade: 75, altura: 1.72, peso: 72, nivelAtividade: 'teste', objetivo: 'teste'))), // Substitua com uma instância válida
        ),
      );
    } catch (e) {
      setState(() => _isLoading = false); // Desativar o indicador de carregamento em caso de erro
      _showErrorDialog(context, e.toString()); // Exibe uma mensagem de erro
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erro de Login'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) => _email = value!,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira seu e-mail' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  onSaved: (value) => _password = value!,
                  validator: (value) => value!.isEmpty ? 'Por favor, insira sua senha' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Entrar'),
                ),
                TextButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => CadastroScreen())); // Redirecione para a tela de cadastro
                  },
                  child: Text('Cadastre-se'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
