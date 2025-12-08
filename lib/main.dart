import 'package:flutter/material.dart';

import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initializeDependencies();

  runApp(const MealDBApp());
}

class MealDBApp extends StatelessWidget {
  const MealDBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Placeholder(),
    );
  }
}
