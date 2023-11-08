import 'package:flutter/material.dart';

import '../../services/alimentos_service.dart';

import 'cadastrar_alimento_screen.dart';
import 'cadastrar_refeicao_screen.dart';
import 'alimentos_cadastrados_screen.dart';

class RefeicoesScreen extends StatefulWidget {
  @override
  _RefeicoesScreenState createState() => _RefeicoesScreenState();
}

class _RefeicoesScreenState extends State<RefeicoesScreen> {
  List<Map<String, dynamic>> refeicoes = [];
  late AlimentosService alimentosService;  // Instância do serviço.

  @override
  void initState() {
    super.initState();
    alimentosService = AlimentosService();  // Inicializando a instância.
    _carregarAlimentos();
  }

  Future<void> _carregarAlimentos() async {
    try {
      // Supondo que AlimentosService.obterAlimentosCadastrados() é a função que você quer chamar.
      List<Map<String, dynamic>> alimentosCadastrados = await alimentosService.obterAlimentosCadastrados();  // Usando a instância.
      if (mounted) {
        setState(() {
          refeicoes = alimentosCadastrados; // Definindo os alimentos recuperados para a lista de refeições.
        });
      }
    } catch (erro) {
      // Tratar a exceção conforme necessário, talvez mostrando um alerta ou log.
      print("Ocorreu um erro ao carregar os alimentos: $erro");
    }
  }

  void _navegarParaFormulario(String escolha) {
    // Atualizei o método para lidar com a navegação para as telas de cadastro.
    if (escolha == 'Cadastrar Refeição') {
      Navigator.of(context).pushNamed('/cadastrar-refeicao').then((resultado) {
        if (resultado != null && resultado is Map<String, dynamic>) {
          setState(() {
            refeicoes.add(
                resultado); // Adiciona a nova refeição retornada ao estado da lista de refeições.
          });
        }
      });
    }
    else if (escolha == 'Cadastrar Alimento') {
      Navigator.of(context).pushNamed('/cadastrar-alimento').then((novoAlimento) async {
        if (novoAlimento != null && novoAlimento is Map<String, dynamic>) {
          // Crie uma instância do seu serviço.
          AlimentosService service = AlimentosService();

          try {
            // Aguarde a obtenção dos alimentos cadastrados.
            List<Map<String, dynamic>> alimentosAtualizados = await service.obterAlimentosCadastrados();

            // Adicione o novo alimento à lista.
            alimentosAtualizados.add(novoAlimento);

            // Navega para a tela de alimentos cadastrados, passando a lista atualizada.
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => AlimentosCadastradosScreen(),
              ),
            );
          } catch (e) {
            // Trate qualquer exceção que ocorra durante a chamada ao serviço ou a navegação.
            // Isso pode ser um diálogo de erro, print no console ou qualquer outra coisa que você preferir.
            print('Ocorreu um erro ao obter os alimentos: $e');
          }
        }
      });
    }
    else if (escolha == 'Alimentos Cadastrados') {
      Navigator.of(context).pushNamed('/alimentos-cadastrados');
      // Mesma lógica aqui, a menos que você queira adicionar funcionalidades específicas quando o usuário retornar desta tela.
    }
  }

  void _excluirRefeicao(int index) {
    setState(() {
      refeicoes.removeAt(index); // Remove a refeição selecionada da lista.
    });
  }

  void _confirmarExclusao(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Excluir Refeição'),
          content: Text('Você tem certeza que deseja excluir esta refeição?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo se o usuário optar por cancelar.
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                _excluirRefeicao(index); // Chama o método de exclusão e atualiza a lista de refeições.
                Navigator.of(context).pop(); // Fecha o diálogo.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeições'),
        actions: [
          PopupMenuButton<String>(
            onSelected: _navegarParaFormulario, // Este método está definido e será chamado conforme o usuário seleciona itens do menu.
            itemBuilder: (BuildContext context) {
              return {'Cadastrar Refeição', 'Cadastrar Alimento', 'Alimentos Cadastrados'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: refeicoes.isEmpty
          ? Center(
        child: Text('Nenhuma refeição cadastrada.'), // Exibe uma mensagem se a lista de refeições estiver vazia.
      )
          : ListView.builder(
        itemCount: refeicoes.length,
        itemBuilder: (context, index) {
          var refeicao = refeicoes[index];

          return GestureDetector(
            onLongPress: () => _confirmarExclusao(index), // Ação de longo pressionamento para a exclusão com confirmação.
            child: Card(
              child: ListTile(
                title: Text(refeicao['titulo'] ?? 'Sem título'), // Mostra o título da refeição ou 'Sem título' se não estiver disponível.
                // Você pode adicionar mais informações visuais sobre a refeição aqui, se desejar.
              ),
            ),
          );
        },
      ),
    );
  }
}
