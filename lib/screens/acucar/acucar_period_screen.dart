import 'package:flutter/material.dart';
import '../../widgets/period_selector.dart';
import 'acucar_day_type_screen.dart';

class AcucarPeriodScreen extends StatefulWidget {
  final String ternos;

  const AcucarPeriodScreen({
    super.key,
    required this.ternos,
  });

  @override
  State<AcucarPeriodScreen> createState() => _AcucarPeriodScreenState();
}

class _AcucarPeriodScreenState extends State<AcucarPeriodScreen> {
  String selectedPeriod = 'Dia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Açúcar - Período'),
        backgroundColor: const Color(0xFFFF9800),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9800).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFFF9800).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFFFF9800),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Configuração: ${widget.ternos} Ternos',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFF9800),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
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
                selectedColor: const Color(0xFFFF9800),
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
                      builder: (context) => AcucarDayTypeScreen(
                        ternos: widget.ternos,
                        period: selectedPeriod,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
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
