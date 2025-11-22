import 'package:flutter/material.dart';
import '../../widgets/period_selector.dart';
import 'celulose_input_screen.dart';

class CelulosePeriodScreen extends StatefulWidget {
  const CelulosePeriodScreen({super.key});

  @override
  State<CelulosePeriodScreen> createState() => _CelulosePeriodScreenState();
}

class _CelulosePeriodScreenState extends State<CelulosePeriodScreen> {
  String selectedPeriod = 'Dia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celulose'),
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Selecione o período',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              PeriodSelector(
                selectedPeriod: selectedPeriod,
                selectedColor: const Color(0xFF2196F3),
                onPeriodSelected: (period) {
                  setState(() {
                    selectedPeriod = period;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CeluloseInputScreen(
                        period: selectedPeriod,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
