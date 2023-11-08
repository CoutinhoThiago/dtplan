import 'package:flutter/material.dart';

import '../../models/exercicio.dart';
import '../../models/plano_de_treino.dart';
import '../../models/treino.dart';
import 'detalhes_plano_treino_screen.dart';

class TreinosScreen extends StatelessWidget {
  final List<PlanoTreino> planosTreino = [
    PlanoTreino(
      nome: 'Treino ABC',
      tipo: 'Musculação',
      treinos: [
        Treino(
          descricao: 'Peito',
          dia: 'Segunda-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Exercício 1',
              descricao: 'Descrição do Exercício 1',
              series: 3, // Adicione a propriedade series
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios para os outros dias da semana
          ],
        ),
        Treino(
          descricao: 'Perna',
          dia: 'Terça-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Exercício 2',
              descricao: 'Descrição do Exercício 2',
              series: 4, // Adicione a propriedade series
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios para os outros dias da semana
          ],
        ),
        Treino(
          descricao: 'Costas',
          dia: 'Quarta-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Exercício 3',
              descricao: 'Descrição do Exercício 3',
              series: 3, // Adicione a propriedade series
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios para os outros dias da semana
          ],
        ),
      ], autor: '',
    ),
    PlanoTreino(
      nome: 'Treino ABCDEF', // Novo plano de treino
      autor: 'Seu Nome',
      tipo: 'Musculação',
      treinos: [
        Treino(
          descricao: 'Segunda-feira',
          dia: 'Segunda-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Esteira 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Quadríceps',
              descricao: 'Leg press',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Abdutores',
              descricao: 'Cadeira abdutora',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Terça-feira',
          dia: 'Terça-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Escada 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino reto',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino inclinado',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Quarta-feira',
          dia: 'Quarta-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Esteira 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Costas',
              descricao: 'Puxador frente supinado',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Costas',
              descricao: 'Remada neutra',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Quinta-feira',
          dia: 'Quinta-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Escada 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino reto',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino inclinado',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Sexta-feira',
          dia: 'Sexta-feira',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Esteira 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Costas',
              descricao: 'Puxador frente supinado',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Costas',
              descricao: 'Remada neutra',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Sábado',
          dia: 'Sábado',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Esteira 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Quadríceps',
              descricao: 'Leg press',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Abdutores',
              descricao: 'Cadeira abdutora',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
        Treino(
          descricao: 'Domingo',
          dia: 'Domingo',
          exercicios: [
            Exercicio(
              musculoAlvo: 'Aquecimento',
              descricao: 'Escada 5 min',
              series: 1,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino reto',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            Exercicio(
              musculoAlvo: 'Peito',
              descricao: 'Supino inclinado',
              series: 3,
              repeticoes: 10, // Adicione a propriedade repeticoes
            ),
            // Adicione mais exercícios e séries conforme necessário
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planos de Treino'),
      ),
      body: ListView.builder(
        itemCount: planosTreino.length,
        itemBuilder: (context, index) {
          final plano = planosTreino[index];
          return ListTile(
            title: Text(plano.nome),
            subtitle: Text('Autor: ${plano.autor} - Tipo: ${plano.tipo}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesPlanoTreinoScreen(plano: plano),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

