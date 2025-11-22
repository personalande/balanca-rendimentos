import '../models/calculation_result.dart';

class AduboCalculator {
  static List<CalculationResult> calculate({
    required double peso,
    required String period, // 'Dia' ou 'Noite'
  }) {
    final results = <CalculationResult>[];
    
    // Constantes
    const double coef1 = 0.3386;
    const double coef2 = 89.25;
    const double mult1 = 0.4;
    const double mult2 = 1.1818;
    
    // Base da fórmula
    final base = (coef1 * peso) + (coef2 * mult1);
    
    // Multiplicadores por tipo de dia
    final multipliers = {
      'Dia útil': 1.0,
      'Domingo': 1.2,
      'Feriado': 2.0,
    };
    
    // Multiplicador de período
    final periodMult = period == 'Noite' ? 1.5 : 1.0;
    
    // Calcular para cada tipo de dia
    multipliers.forEach((dayType, dayMult) {
      // Fórmula Adubo:
      // ((0,3386*C5) + (89,25*0,4)) * MULT * 1,1818
      
      final total = base * dayMult * periodMult * mult2;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: 'CHEFE',
        value: total,
        period: period,
      ));
    });
    
    return results;
  }
}
