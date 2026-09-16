import 'package:flutter/material.dart';
import '../components/calculator_button.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String visor = '0';
  double primeiroNumero = 0;
  String operacao = '';
  bool novoNumero = false;
  final List<String> historico = [];

  void adicionarNumero(String numero) {
    setState(() {
      if (visor == '0' || novoNumero) {
        visor = numero;
        novoNumero = false;
      } else {
        visor += numero;
      }
    });
  }

  void adicionarDecimal() {
    setState(() {
      if (novoNumero) {
        visor = '0.';
        novoNumero = false;
      } else if (!visor.contains('.')) {
        visor += '.';
      }
    });
  }

  void escolherOperacao(String novaOperacao) {
    setState(() {
      primeiroNumero = double.tryParse(visor) ?? 0;
      operacao = novaOperacao;
      novoNumero = true;
    });
  }

  void calcular() {
    final segundoNumero = double.tryParse(visor) ?? 0;
    double resultado;

    if (operacao == '+') {
      resultado = primeiroNumero + segundoNumero;
    } else if (operacao == '-') {
      resultado = primeiroNumero - segundoNumero;
    } else if (operacao == '×') {
      resultado = primeiroNumero * segundoNumero;
    } else if (operacao == '÷') {
      if (segundoNumero == 0) {
        setState(() {
          visor = 'Não é possível dividir por 0';
          novoNumero = true;
        });
        return;
      }
      resultado = primeiroNumero / segundoNumero;
    } else {
      return;
    }

    final expressao = '${formatar(primeiroNumero)} $operacao '
        '${formatar(segundoNumero)} = ${formatar(resultado)}';

    setState(() {
      visor = formatar(resultado);
      historico.insert(0, expressao);
      if (historico.length > 3) {
        historico.removeLast();
      }
      novoNumero = true;
      operacao = '';
    });
  }

  String formatar(double numero) {
    if (numero == numero.toInt()) {
      return numero.toInt().toString();
    }
    return numero.toString();
  }

  void apagar() {
    setState(() {
      if (visor.length <= 1) {
        visor = '0';
      } else {
        visor = visor.substring(0, visor.length - 1);
      }
    });
  }

  void limpar() {
    setState(() {
      visor = '0';
      primeiroNumero = 0;
      operacao = '';
      novoNumero = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest,
                  ),
                  child: Text(
                    visor,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CalculatorButton(texto: 'C', onPressed: limpar),
                    CalculatorButton(texto: '⌫', onPressed: apagar),
                    CalculatorButton(
                      texto: '÷',
                      destaque: true,
                      onPressed: () => escolherOperacao('÷'),
                    ),
                    CalculatorButton(
                      texto: '×',
                      destaque: true,
                      onPressed: () => escolherOperacao('×'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      texto: '7',
                      onPressed: () => adicionarNumero('7'),
                    ),
                    CalculatorButton(
                      texto: '8',
                      onPressed: () => adicionarNumero('8'),
                    ),
                    CalculatorButton(
                      texto: '9',
                      onPressed: () => adicionarNumero('9'),
                    ),
                    CalculatorButton(
                      texto: '-',
                      destaque: true,
                      onPressed: () => escolherOperacao('-'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      texto: '4',
                      onPressed: () => adicionarNumero('4'),
                    ),
                    CalculatorButton(
                      texto: '5',
                      onPressed: () => adicionarNumero('5'),
                    ),
                    CalculatorButton(
                      texto: '6',
                      onPressed: () => adicionarNumero('6'),
                    ),
                    CalculatorButton(
                      texto: '+',
                      destaque: true,
                      onPressed: () => escolherOperacao('+'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      texto: '1',
                      onPressed: () => adicionarNumero('1'),
                    ),
                    CalculatorButton(
                      texto: '2',
                      onPressed: () => adicionarNumero('2'),
                    ),
                    CalculatorButton(
                      texto: '3',
                      onPressed: () => adicionarNumero('3'),
                    ),
                    CalculatorButton(
                      texto: '=',
                      destaque: true,
                      onPressed: calcular,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      texto: '0',
                      onPressed: () => adicionarNumero('0'),
                    ),
                    CalculatorButton(
                      texto: '.',
                      onPressed: adicionarDecimal,
                    ),
                  ],
                ),
                if (historico.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Histórico recente',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...historico.map(
                    (item) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(item),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
