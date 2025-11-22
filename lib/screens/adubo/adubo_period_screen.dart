import 'package:flutter/material.dart';
import '../../widgets/period_selector.dart';
import 'adubo_input_screen.dart';

class AduboPeriodScreen extends StatefulWidget {
  const AduboPeriodScreen({super.key});

  @override
  State<AduboPeriodScreen> createState() => _AduboPeriodScreenState();
}

class _AduboPeriodScreenState extends State<AduboPeriodScreen> {
  String selectedPeriod = 'Dia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adubo'),
        backgroundColor: const Color(0xFF4CAF50),
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
                selectedColor: const Color(0xFF4CAF50),
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
                      builder: (context) => AduboInputScreen(
                        period: selectedPeriod,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
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
