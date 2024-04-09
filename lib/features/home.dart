import 'package:flutter/material.dart';
import 'package:nomina_calc/features/nomina_calculation/presentation/pages/nomina_calculation.dart';

class HomeNomina extends StatefulWidget {
  const HomeNomina({super.key});

  @override
  State<HomeNomina> createState() => _HomeNominaState();
}

class _HomeNominaState extends State<HomeNomina> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Calculadora de Nomina';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const NominaCalcutation(),
      ),
    );
  }
}