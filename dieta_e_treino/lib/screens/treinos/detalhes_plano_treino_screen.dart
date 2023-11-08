import 'package:flutter/material.dart';
import '../../models/plano_de_treino.dart';
import 'detalhes_treino_screen.dart';

class DetalhesPlanoTreinoScreen extends StatelessWidget {
  final PlanoTreino plano;

  DetalhesPlanoTreinoScreen({required this.plano});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Plano de Treino'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Plano: ${plano.nome}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Autor: ${plano.autor}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tipo: ${plano.tipo}',
              style: TextStyle(fontSize: 16),
            ),
            Divider(),
            Text(
              'Treinos do Plano:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: plano.treinos.length,
              itemBuilder: (context, index) {
                final treino = plano.treinos[index];
                return ListTile(
                  title: Text(
                    treino.descricao,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesTreinoScreen(treino: treino),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
