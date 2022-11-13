import 'package:calc/screens/home_screen/home_screen.dart';
import 'package:calc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ? Неоморфизм – это слияние слов нео и скевоморфизм. Этот стиль использует размытие, угол и интенсивность тени объекта для его выделения. 

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      // Убирает надпись дебаггера
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'Montserrat', bodyColor: kSecondaryColor),
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
