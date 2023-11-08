import 'package:flutter/material.dart';
// Importe a biblioteca de gráficos que você vai usar.
import 'package:fl_chart/fl_chart.dart';

class HistoricoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico"),
      ),
      body: ListView(
        children: [
          GraficoCard(
            titulo: 'Gráfico de Peso',
            child: Placeholder(), // Substitua pelo seu gráfico real de peso aqui.
            onTap: () {
              // Aqui, você pode implementar a lógica para adicionar/atualizar o peso.
              print('Gráfico de peso tocado');
            },
          ),
          GraficoCard(
            titulo: 'Gráfico de Água',
            child: Placeholder(), // Substitua pelo seu gráfico real de consumo de água aqui.
            onTap: () {
              // Aqui, você pode implementar a lógica para adicionar/atualizar a ingestão de água.
              print('Gráfico de água tocado');
            },
          ),
          // Continue com os outros gráficos seguindo o mesmo padrão.
        ],
      ),
    );
  }
}

// Widget para o card do gráfico, que tornará mais fácil reutilizar o design do card.
class GraficoCard extends StatelessWidget {
  final String titulo;
  final Widget child;
  final VoidCallback onTap;

  const GraficoCard({
    Key? key,
    required this.titulo,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Expanded(
                  child: Center(
                    child: child,  // Seu gráfico real será inserido aqui.
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
