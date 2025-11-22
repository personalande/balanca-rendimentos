import 'package:flutter/material.dart';
import '../../models/calculation_result.dart';
import '../../services/acucar_calculator.dart';
import '../../widgets/result_card.dart';
import '../../theme/app_theme.dart';
import '../home_screen.dart';

class AcucarResultsScreen extends StatelessWidget {
  final double maiorPeso;
  final double segundoPeso;
  final String ternos;
  final String period;
  final String dayType;

  const AcucarResultsScreen({
    super.key,
    required this.maiorPeso,
    required this.segundoPeso,
    required this.ternos,
    required this.period,
    required this.dayType,
  });

  @override
  Widget build(BuildContext context) {
    final results = AcucarCalculator.calculate(
      maiorPeso: maiorPeso,
      segundoPeso: segundoPeso,
      ternos: ternos,
      period: period,
      dayType: dayType,
    );

    final is2Ternos = ternos == '2';
    
    // Determinar cor baseada no tipo de dia
    Color dayColor;
    switch (dayType) {
      case 'Dia útil':
        dayColor = AppTheme.diaUtilColor;
        break;
      case 'Domingo':
        dayColor = AppTheme.domingoColor;
        break;
      case 'Feriado':
        dayColor = AppTheme.feriadoColor;
        break;
      default:
        dayColor = AppTheme.diaUtilColor;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados - Açúcar'),
        backgroundColor: const Color(0xFFFF9800),
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
                              Icons.grain,
                              color: Color(0xFFFF9800),
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            const Text(
                              'Açúcar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Configuração', '$ternos Ternos'),
                        _buildInfoRow('Período', period),
                        _buildInfoRow('Tipo de dia', dayType),
                        _buildInfoRow('Maior peso', '${maiorPeso.toStringAsFixed(2)} kg'),
                        _buildInfoRow(
                          is2Ternos ? 'Menor peso' : '3º Terno',
                          '${segundoPeso.toStringAsFixed(2)} kg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  Text(
                    is2Ternos 
                        ? 'Resultados (CHEFE e LINGADA)'
                        : 'Resultados (CHEFE e 3º TERNO)',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Result cards
                  for (final result in results)
                    ResultCard(
                      result: result,
                      color: dayColor,
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
                        backgroundColor: const Color(0xFFFF9800),
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
