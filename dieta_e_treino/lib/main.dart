import 'package:dieta_e_treino/providers/alimentos_provider.dart';
import 'package:dieta_e_treino/screens/refeicoes/alimentos_cadastrados_screen.dart';
import 'package:dieta_e_treino/screens/treinos/cadastrar_exercicios_scren.dart';
import 'package:dieta_e_treino/screens/treinos/listar_exercicios_scren.dart';
import 'package:dieta_e_treino/services/exercicios_serivice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart'; // A tela inicial

// Importe os arquivos de tela de cadastro aqui
import 'screens/refeicoes/refeicoes_screen.dart'; // A tela de listagem de refeições
import 'screens/refeicoes/cadastrar_refeicao_screen.dart'; // A tela de cadastro de refeições
import 'screens/refeicoes/cadastrar_alimento_screen.dart'; // A tela de cadastro de alimentos
import 'screens/refeicoes/alimentos_cadastrados_screen.dart'; // A tela de listagem de alimentos

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AlimentosProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dieta e Treino',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Em vez de usar o atributo 'home', vamos definir nossas rotas nomeadas.
      initialRoute: '/', // O caminho '/' corresponde à tela inicial
      routes: {
        '/': (context) => HomeScreen(), // Esta é a sua tela inicial
        '/refeicoes': (context) => RefeicoesScreen(), // Tela de listagem de refeições

        // Adicionando as rotas para as telas de cadastro
        '/cadastrar-refeicao': (context) => CadastrarRefeicaoScreen(),
        '/cadastrar-alimento': (context) => CadastrarAlimentoScreen(),

        '/cadastrar-exercicio': (context) => CadastrarExercicioScreen(),

        // Adicionando as rotas para as telas de lsitegem
        '/alimentos-cadastrados': (context) => AlimentosCadastradosScreen(),
        '/exercicios-cadastrados': (context) => ListagemExerciciosScreen(),
      },
    );
  }
}
