import 'dart:convert';
import 'package:flutter/material.dart';

class CadastroAlunoPage extends StatefulWidget {
  const CadastroAlunoPage({super.key});

  @override
  State<CadastroAlunoPage> createState() => _CadastroAlunoPageState();
}

class _CadastroAlunoPageState extends State<CadastroAlunoPage> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final idadeController = TextEditingController();
  final cursoController = TextEditingController();

  String? jsonResultado;

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    idadeController.dispose();
    cursoController.dispose();
    super.dispose();
  }

  void salvar() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final Map<String, dynamic> aluno = {
      'nome': nomeController.text,
      'email': emailController.text,
      'idade': idadeController.text,
      'curso': cursoController.text,
    };

    setState(() {
      jsonResultado = const JsonEncoder.withIndent('  ').convert(aluno);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Aluno')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Novo aluno',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Preencha os dados abaixo para gerar o cadastro.'),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty
                            ? 'Nome é obrigatório'
                            : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail é obrigatório';
                      }
                      if (!value.contains('@')) {
                        return 'O e-mail deve conter @';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: idadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Idade',
                      prefixIcon: Icon(Icons.cake_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Idade é obrigatória';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Digite uma idade numérica válida';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: cursoController,
                    decoration: const InputDecoration(
                      labelText: 'Curso',
                      prefixIcon: Icon(Icons.menu_book_outlined),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty
                            ? 'Curso é obrigatório'
                            : null,
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: salvar,
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Salvar'),
                    ),
                  ),
                  if (jsonResultado != null) ...[
                    const SizedBox(height: 28),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Resultado do cadastro',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SelectableText(
                              jsonResultado!,
                              style: const TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
