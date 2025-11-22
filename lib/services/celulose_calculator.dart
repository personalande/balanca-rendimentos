import '../models/calculation_result.dart';

class CeluloseCalculator {
  static List<CalculationResult> calculate({
    required double maiorPeso,
    required double menorPeso,
    required String period, // 'Dia' ou 'Noite'
  }) {
    final results = <CalculationResult>[];
    
    // Constantes
    const double coef1 = 0.3807;
    const double coef2 = 73.5;
    const double mult1 = 0.4;
    const double mult2 = 1.3;
    const double mult3 = 0.6;
    const double mult4 = 1.1818;
    
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
      // Fórmula Celulose:
      // (((0,3807*D5)*1,3 + (73,5*0,4)*1,3)*MULT*1,1818) +
      // (((0,3807*D6)*0,6 + (73,5*0,4)*0,6)*MULT*1,1818)
      
      final parte1 = ((coef1 * maiorPeso) * mult2 + (coef2 * mult1) * mult2) * 
                     dayMult * periodMult * mult4;
      final parte2 = ((coef1 * menorPeso) * mult3 + (coef2 * mult1) * mult3) * 
                     dayMult * periodMult * mult4;
      
      final total = parte1 + parte2;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: 'CHEFE + LINGADA',
        value: total,
        period: period,
      ));
    });
    
    return results;
  }
}
