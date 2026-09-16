import 'package:flutter/material.dart';

class Curso {
  final String nome;
  final String imagem;
  final String descricao;
  final String duracao;

  const Curso({
    required this.nome,
    required this.imagem,
    required this.descricao,
    required this.duracao,
  });
}

const cursos = [
  Curso(
    nome: 'Análise e Desenvolvimento de Sistemas',
    imagem: 'assets/images/ads.png',
    duracao: '2,5 anos',
    descricao:
        'Curso focado no desenvolvimento, análise e manutenção de sistemas e soluções de tecnologia.',
  ),
  Curso(
    nome: 'Engenharia de Software',
    imagem: 'assets/images/software.png',
    duracao: '4 anos',
    descricao:
        'Formação voltada para engenharia, arquitetura, desenvolvimento e qualidade de software.',
  ),
  Curso(
    nome: 'Ciência de Dados',
    imagem: 'assets/images/dados.png',
    duracao: '4 anos',
    descricao:
        'Estudo de dados, programação, estatística e técnicas para transformar informações em conhecimento.',
  ),
  Curso(
    nome: 'Segurança da Informação',
    imagem: 'assets/images/seguranca.png',
    duracao: '3 anos',
    descricao:
        'Área dedicada à proteção de sistemas, redes, dados e informações digitais.',
  ),
];

class CursosPage extends StatelessWidget {
  const CursosPage({super.key});

  void mostrarDetalhes(BuildContext context, Curso curso) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    curso.imagem,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  curso.nome,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.schedule_outlined),
                    const SizedBox(width: 8),
                    Text(curso.duracao),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  curso.descricao,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cursos')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cursos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) {
          final curso = cursos[index];

          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => mostrarDetalhes(context, curso),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      curso.imagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
                    child: Text(
                      curso.nome,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                    child: Text(
                      curso.duracao,
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
