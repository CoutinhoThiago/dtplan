import 'package:flutter/material.dart';
import '../../models/treino.dart';

class DetalhesTreinoScreen extends StatefulWidget {
  final Treino treino;

  DetalhesTreinoScreen({required this.treino});

  @override
  _DetalhesTreinoScreenState createState() => _DetalhesTreinoScreenState();
}

class _DetalhesTreinoScreenState extends State<DetalhesTreinoScreen> {
  List<bool> exerciciosConcluidos = [];

  @override
  void initState() {
    super.initState();
    exerciciosConcluidos = List.generate(widget.treino.exercicios.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Treino: ${widget.treino.descricao}'),
      ),
      body: ListView.builder(
        itemCount: widget.treino.exercicios.length,
        itemBuilder: (context, index) {
          final exercicio = widget.treino.exercicios[index];
          final descricao = exercicio.descricao;
          final repeticoes = exercicio.repeticoes.toString();
          final series = exercicio.series.toString();
          final listagem = '$descricao $repeticoes x$series';

          return ListTile(
            title: Text(
              listagem,
              style: TextStyle(
                decoration: exerciciosConcluidos[index] ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: exerciciosConcluidos[index],
              onChanged: (value) {
                setState(() {
                  exerciciosConcluidos[index] = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione ação para marcar todos os exercícios como concluídos ou não
          setState(() {
            exerciciosConcluidos = List.generate(widget.treino.exercicios.length, (index) => true);
          });
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
