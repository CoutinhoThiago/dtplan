import 'package:flutter/material.dart';
import '../../services/exercicios_serivice.dart';

class ListagemExerciciosScreen extends StatefulWidget {
  @override
  _ListagemExerciciosScreenState createState() => _ListagemExerciciosScreenState();
}

class _ListagemExerciciosScreenState extends State<ListagemExerciciosScreen> {
  final ExerciseService exerciseService = ExerciseService();
  late Future<Map<String, dynamic>> futureExercises;

  @override
  void initState() {
    super.initState();
    futureExercises = exerciseService.getExercise(); // Certifique-se que o nome do método está correto
  }

  Icon getExerciseIcon(int tipo) {
    // Se 'tipo' é um número, certifique-se de compará-lo como tal
    int tipoNumerico = tipo ?? 0; // Converte para int ou usa 0 como padrão
    return tipoNumerico == 2 ? Icon(Icons.directions_run) : Icon(Icons.fitness_center);
  }

  String getSubtitle(dynamic exercise) {
    // Se 'tipo' é um número, faça a conversão antes de comparar
    int tipoNumerico = int.tryParse(exercise['tipo'].toString()) ?? 0;
    return tipoNumerico == 2
        ? 'Tipo: Aeróbico\nDuração: ${exercise['duracao'].toString()}'
        : 'Tipo: Musculação\nMusculoalvo: ${exercise['musculoalvo'].toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Exercícios'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureExercises,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var exercises = snapshot.data!['content'] as List<dynamic>;
            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                var exercise = exercises[index];
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: getExerciseIcon(exercise['tipo']),
                    title: Text(
                      exercise['descricao'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(getSubtitle(exercise)),
                    // Outras informações podem ser adicionadas aqui
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
