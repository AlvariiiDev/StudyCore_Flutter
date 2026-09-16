import 'package:flutter/material.dart';
import '../components/menu_drawer.dart';
import 'calculadora_page.dart';
import 'cadastro_aluno_page.dart';
import 'cursos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: const Text('StudyCore'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Olá, João 👋',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tudo o que você precisa para organizar sua jornada acadêmica.',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 28),
            _CardFuncao(
              icone: Icons.calculate_rounded,
              titulo: 'Calculadora',
              descricao: 'Faça cálculos de forma rápida.',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CalculadoraPage()),
              ),
            ),
            _CardFuncao(
              icone: Icons.menu_book_rounded,
              titulo: 'Cursos',
              descricao: 'Explore cursos disponíveis.',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CursosPage()),
              ),
            ),
            _CardFuncao(
              icone: Icons.person_add_alt_1_rounded,
              titulo: 'Cadastro de Aluno',
              descricao: 'Cadastre os dados de um aluno.',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CadastroAlunoPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardFuncao extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final VoidCallback onTap;

  const _CardFuncao({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icone, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(descricao),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 17),
            ],
          ),
        ),
      ),
    );
  }
}
