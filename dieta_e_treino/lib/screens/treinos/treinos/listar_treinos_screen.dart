
import 'package:flutter/material.dart';
import '../../../models/treino.dart';
import 'detalhes_treino_screen.dart'; // Substitua pelo caminho correto

class ListagemTreinosScreen extends StatefulWidget {
  @override
  _ListagemTreinosScreenState createState() => _ListagemTreinosScreenState();
}

class _ListagemTreinosScreenState extends State<ListagemTreinosScreen> {
  List<Treino> treinos = [
    Treino(descricao: "Treino A", dia: '', exercicios: []),
    Treino(descricao: "Treino B", dia: '', exercicios: []),
    // Adicione mais treinos aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Treinos"),
      ),
      body: ListView.builder(
        itemCount: treinos.length,
        itemBuilder: (context, index) {
          Treino treino = treinos[index];
          return ListTile(
            title: Text(treino.descricao),
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
    );
  }
}
