import 'package:flutter/material.dart';
import '../../../services/exercicios_serivice.dart';

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
    futureExercises = exerciseService.getExercise();
  }

  Icon getExerciseIcon(dynamic tipo) {
    // Trata possíveis valores null para 'tipo'
    int tipoNumerico = tipo != null ? int.tryParse(tipo.toString()) ?? 0 : 0;
    return tipoNumerico == 2 ? Icon(Icons.directions_run) : Icon(
        Icons.fitness_center);
  }

  String getSubtitle(dynamic exercise) {
    // Trata possíveis valores null para 'tipo'
    int tipoNumerico = exercise['tipo'] != null ? int.tryParse(
        exercise['tipo'].toString()) ?? 0 : 0;
    return tipoNumerico == 2
        ? 'Tipo: Aeróbico\nDuração: ${exercise['duracao'] ?? 'N/A'}'
        : 'Tipo: Musculação\nMusculoalvo: ${exercise['musculoalvo'] ?? 'N/A'}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amber[900]),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Listagem de exercícios",
          style: TextStyle(color: Colors.amber[900]),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureExercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!['content'] == null) {
            return Center(child: Text("Nenhum dado disponível"));
          }

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
                    exercise['descricao'] ?? 'Sem descrição',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(getSubtitle(exercise)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}