import '../models/alimento.dart';

class Refeicao {
  final String nome;
  final List<Alimento> alimentos;

  Refeicao({
    required this.nome,
    required this.alimentos,
  });

  // Calcula o total de calorias da refeição somando as calorias de cada alimento.
  double get totalCalorias {
    double calorias = 0.0;
    for (var alimento in alimentos) {
      calorias += alimento.calorias;
    }
    return calorias;
  }

  // Calcula o total de proteínas da refeição.
  double get totalProteinas {
    double proteinas = 0.0;
    for (var alimento in alimentos) {
      proteinas += alimento.proteina;
    }
    return proteinas;
  }

  // Calcula o total de carboidratos da refeição.
  double get totalCarboidratos {
    double carboidratos = 0.0;
    for (var alimento in alimentos) {
      carboidratos += alimento.carboidrato;
    }
    return carboidratos;
  }

  // Calcula o total de gorduras da refeição.
  double get totalGorduras {
    double gorduras = 0.0;
    for (var alimento in alimentos) {
      gorduras += alimento.gordura;
    }
    return gorduras;
  }

  // Método que retorna uma representação textual da refeição.
  @override
  String toString() {
    return 'Refeição: $nome\n' +
        'Total de Calorias: ${totalCalorias} kcal\n' +
        'Proteínas: ${totalProteinas} g\n' +
        'Carboidratos: ${totalCarboidratos} g\n' +
        'Gorduras: ${totalGorduras} g';
  }
}
