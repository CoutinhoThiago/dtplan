import 'package:flutter/material.dart';
// Importe quaisquer outros pacotes ou modelos que você possa precisar

class CadastrarTreinoScreen extends StatefulWidget {
  @override
  _CadastrarTreinoScreenState createState() => _CadastrarTreinoScreenState();
}

class _CadastrarTreinoScreenState extends State<CadastrarTreinoScreen> {
  final _formKey = GlobalKey<FormState>();
  String descricao = '';
  String autor = '';
  String tipo = '';

  // Método para salvar o treino
  void _salvarTreino() {
    if (_formKey.currentState!.validate()) {
      // Aqui você pode adicionar a lógica para salvar o treino
      // Por exemplo, enviar para uma API ou salvar em uma base de dados local

      print('Treino salvo com sucesso!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Treino'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Descrição'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a descrição';
                }
                return null;
              },
              onSaved: (value) => descricao = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Autor'),
              onSaved: (value) => autor = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Tipo'),
              onSaved: (value) => tipo = value!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _salvarTreino,
              child: Text('Salvar Treino'),
            ),
          ],
        ),
      ),
    );
  }
}
