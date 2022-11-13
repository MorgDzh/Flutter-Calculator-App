import 'package:calc/screens/home_screen/components/calculator_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CalculatorButton(
          text: '1',
        ),
      ),
    );
  }
}
