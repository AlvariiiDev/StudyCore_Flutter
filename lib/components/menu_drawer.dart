import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/calculadora_page.dart';
import '../screens/cadastro_aluno_page.dart';
import '../screens/cursos_page.dart';
import '../screens/login_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  void abrir(BuildContext context, Widget pagina) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => pagina),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.school_rounded, size: 42),
                  SizedBox(height: 12),
                  Text(
                    'StudyCore',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Seu espaço acadêmico'),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Início'),
              onTap: () => abrir(context, const HomePage()),
            ),
            ListTile(
              leading: const Icon(Icons.calculate_rounded),
              title: const Text('Calculadora'),
              onTap: () => abrir(context, const CalculadoraPage()),
            ),
            ListTile(
              leading: const Icon(Icons.person_add_alt_1_rounded),
              title: const Text('Cadastrar Aluno'),
              onTap: () => abrir(context, const CadastroAlunoPage()),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_rounded),
              title: const Text('Cursos'),
              onTap: () => abrir(context, const CursosPage()),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
