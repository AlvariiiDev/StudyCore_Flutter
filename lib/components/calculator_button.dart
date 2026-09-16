import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final bool destaque;

  const CalculatorButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 64,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: destaque
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              foregroundColor: destaque
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}