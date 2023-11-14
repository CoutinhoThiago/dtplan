import 'dart:io';

import 'package:flutter/material.dart';
import '../../models/plano_de_treino.dart';
import '../../services/treinos_service.dart';
import 'detalhes_plano_treino_screen.dart';

class TreinosScreen extends StatefulWidget {
  @override
  _TreinosScreenState createState() => _TreinosScreenState();
}

class _TreinosScreenState extends State<TreinosScreen> {
  final PlanoDeTreinoService _service = PlanoDeTreinoService();
  List<PlanoTreino> _planosTreino = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTrainingPlans();
  }

  Future<void> _loadTrainingPlans() async {
    var plans = await _service.fetchPlanoDeTreinoService();
    setState(() {
      _planosTreino = plans;
      _isLoading = false;
    });
  }

  void _navegarParaFormulario(String escolha) {
    // Atualizei o método para lidar com a navegação para as telas de cadastro.
    if (escolha == 'Cadastrar Exercicio') {
      Navigator.of(context).pushNamed('/cadastrar-exercicio').then((resultado) {
        if (resultado != null && resultado is Map<String, dynamic>) {
          // setState(() {
          //   exercicios.add(
          //       resultado); // Adiciona a nova refeição retornada ao estado da lista de refeições.
          // });
        }
      });
    }
    else if (escolha == 'Exercicios Cadastrados') {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos de Treino'),
        //backgroundColor: Colors.blueGrey, // Ajuste a cor conforme o tema do app
        actions: [
          PopupMenuButton<String>(
            onSelected: _navegarParaFormulario,
            itemBuilder: (BuildContext context) {
              return {'Cadastrar Exercicio', 'Exercicios cadastrados'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
        itemCount: _planosTreino.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final plano = _planosTreino[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.fitness_center), // Ícone treino de usculação
              title: Text(
                plano.nome,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.0),
                  Text('Autor: ${plano.autor}'),
                  SizedBox(height: 2.0),
                  Text('Tipo: ${plano.tipo}')
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesPlanoTreinoScreen(plano: plano),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
