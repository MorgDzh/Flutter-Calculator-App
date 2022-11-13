import 'dart:ui';

import 'package:calc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculationText extends ConsumerWidget {
  const CalculationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // ! FittedBox -> Масштабирует и позиционирует своего потомка внутри себя в соответствии с размерами.
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 32,
              color: kSecondaryColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '0',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
