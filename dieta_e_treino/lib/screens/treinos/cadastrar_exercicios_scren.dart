import 'package:flutter/material.dart';

import '../../services/exercicios_serivice.dart';

class CadastrarExercicioScreen extends StatefulWidget {
  @override
  _CadastrarExercicioScreenState createState() => _CadastrarExercicioScreenState();
}

class _CadastrarExercicioScreenState extends State<CadastrarExercicioScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de exercício
  final _descricaoController = TextEditingController();
  String _tipoExercicio = 'Musculação'; // Opções: 'Musculação', 'Aeróbico'
  final _musculoAlvoController = TextEditingController();
  final _seriesController = TextEditingController();
  final _repeticoesMinController = TextEditingController();
  final _repeticoesMaxController = TextEditingController();
  final _cargaController = TextEditingController();
  final _duracaoController = TextEditingController();
  final _intensidadeController = TextEditingController();

  int ? _selectedSeries;

  final exerciseService = ExerciseService();

  @override
  void dispose() {
    // Dispor de todos os controladores
    _descricaoController.dispose();
    _musculoAlvoController.dispose();
    _seriesController.dispose();
    _repeticoesMinController.dispose();
    _repeticoesMaxController.dispose();
    _cargaController.dispose();
    _duracaoController.dispose();
    _intensidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Exercício'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                  controller: _descricaoController,
                  decoration: InputDecoration(
                      labelText: 'Descrição do Exercício'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a descrição do exercício.';
                    }
                    return null;
                  },
              ),
              // Seus campos existentes...
              DropdownButtonFormField(
                value: _tipoExercicio,
                onChanged: (String? newValue) {
                  setState(() {
                    _tipoExercicio = newValue!;
                  });
                },
                items: <String>['Musculação', 'Aeróbico']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Tipo de Exercício'),
              ),
              if (_tipoExercicio == 'Musculação')
                TextFormField(
                  controller: _musculoAlvoController,
                  decoration: InputDecoration(
                      labelText: 'Músculo Alvo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o músculo alvo.';
                    }
                    return null;
                  },
                ),
              if (_tipoExercicio == 'Musculação')
                DropdownButtonFormField<int>(
                  value: _selectedSeries,
                  decoration: InputDecoration(
                    labelText: 'Séries',
                  ),
                  items: <int>[6, 8, 10, 12, 15, 20]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _selectedSeries = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, selecione uma série.';
                    }
                    return null;
                  },
                ),
              if (_tipoExercicio == 'Musculação')
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _repeticoesMinController,
                  decoration: InputDecoration(
                    labelText: 'Repetições Mínimas',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o número mínimo de repetições.';
                    }
                    return null;
                  },
                ),
              if (_tipoExercicio == 'Musculação')
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _repeticoesMaxController,
                  decoration: InputDecoration(
                    labelText: 'Repetições Máximas (Opcional)',
                  ),
                ),
              if (_tipoExercicio == 'Musculação')
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cargaController,
                  decoration: InputDecoration(
                      labelText: 'Carga'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a carga inicial.';
                    }
                    return null;
                  },
                ),
              if (_tipoExercicio == 'Aeróbico')
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _duracaoController,
                  decoration: InputDecoration(
                      labelText: 'Duração'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a duração.';
                    }
                    return null;
                  },
                ),
              if (_tipoExercicio == 'Aeróbico')
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _intensidadeController,
                  decoration: InputDecoration(
                      labelText: 'Intensidade'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a intensidade.';
                    }
                    return null;
                  },
                ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      // Crie um mapa com os dados do exercício com base nos controladores
                      var exerciseData = {
                        "descricao": _descricaoController.text,
                        "ativo": true,
                        "tipo": _tipoExercicio == 'Musculação' ? 1 : 2, // Dependendo do tipo
                        "musculo_alvo": _musculoAlvoController.text,
                        "series": 20, //int.parse(_seriesController.text),
                        "repeticoes_min": int.parse(_repeticoesMinController.text),
                        "repeticoes_max": int.parse(_repeticoesMaxController.text),
                        "carga": double.parse(_cargaController.text),
                      };

                      // Chame o serviço para postar os dados
                      final response = await exerciseService.postExercise(exerciseData);

                      // Verifique a resposta e tome ações com base nela
                      if (response.statusCode == 200) {
                        print('Exercício salvo com sucesso!');
                      } else {
                        print('Erro ao salvar');
                        // Falha: A solicitação POST não foi bem-sucedida
                        // Trate o erro de acordo com as necessidades da sua aplicação.
                      }
                    } catch (e) {
                      // Trate exceções, se ocorrerem
                      print('Erro ao salvar exercício: $e');
                      // Você pode adicionar ações adicionais aqui, como exibir uma mensagem de erro.
                    }
                  }
                },
                child: Text('Salvar Exercício'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


