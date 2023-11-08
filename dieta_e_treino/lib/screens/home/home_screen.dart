import 'package:flutter/material.dart';
import '../../models/usuario.dart';
import '../perfil/perfil_screen.dart';
import '../treinos/treinos_screen.dart';
import '../refeicoes/refeicoes_screen.dart';
import '../historico/historico_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final ValueNotifier<Usuario> usuarioNotifier; // Declare como late final

  late List<Widget> _widgetOptions; // Declare como late, não inicialize imediatamente

  @override
  void initState() {
    super.initState();
    // Inicialize o usuarioNotifier e _widgetOptions aqui
    usuarioNotifier = ValueNotifier<Usuario>(
      Usuario(
        nome: 'Nome do Usuário',
        idade: 30,
        altura: 1.75,
        peso: 70.5,
        nivelAtividade: 'Ativo',
        objetivo: 'Manter a forma', imagePath: null,
      ),
    );

    _widgetOptions = <Widget>[
      HistoricoScreen(),
      TreinosScreen(),
      RefeicoesScreen(),
      PerfilScreen(usuarioNotifier: usuarioNotifier), // Aqui não precisa mais do parâmetro 'usuario'.
    ];
  }

  // Método para lidar com a lógica necessária quando um item do menu é tocado.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice selecionado com o índice do item que foi tocado.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar removido para não ter barra no topo
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // Mostra o widget selecionado com base no índice atual.
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue, // Cor de fundo da parra de navegação azul
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Treinos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Refeições',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Destaca o item de menu selecionado.
        selectedItemColor: Colors.amber[800], // Define a cor do item de menu selecionado.
        onTap: _onItemTapped, // Ação que ocorre quando um item é tocado.
      ),
    );
  }
}