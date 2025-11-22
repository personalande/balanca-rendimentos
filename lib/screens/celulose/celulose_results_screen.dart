import 'package:flutter/material.dart';
import '../../models/calculation_result.dart';
import '../../services/celulose_calculator.dart';
import '../../widgets/result_card.dart';
import '../../theme/app_theme.dart';
import '../home_screen.dart';

class CeluloseResultsScreen extends StatelessWidget {
  final double maiorPeso;
  final double menorPeso;
  final String period;

  const CeluloseResultsScreen({
    super.key,
    required this.maiorPeso,
    required this.menorPeso,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    final results = CeluloseCalculator.calculate(
      maiorPeso: maiorPeso,
      menorPeso: menorPeso,
      period: period,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados - Celulose'),
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  // Info card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D2D2D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.inventory_2,
                              color: Color(0xFF2196F3),
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Celulose',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Período', period),
                        _buildInfoRow('Maior peso', '${maiorPeso.toStringAsFixed(2)} kg'),
                        _buildInfoRow('Menor peso', '${menorPeso.toStringAsFixed(2)} kg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  const Text(
                    'Resultados por tipo de dia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Result cards
                  ResultCard(
                    result: results[0],
                    color: AppTheme.diaUtilColor,
                  ),
                  ResultCard(
                    result: results[1],
                    color: AppTheme.domingoColor,
                  ),
                  ResultCard(
                    result: results[2],
                    color: AppTheme.feriadoColor,
                  ),
                ],
              ),
            ),
            
            // Bottom buttons
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFF2D2D2D),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFF404040)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Voltar'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2196F3),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Nova Carga'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFB0B0B0),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
