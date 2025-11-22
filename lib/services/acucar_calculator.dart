import '../models/calculation_result.dart';

class AcucarCalculator {
  static List<CalculationResult> calculate({
    required double maiorPeso,
    required double segundoPeso, // Menor peso (2 ternos) ou Peso 3º terno (3 ternos)
    required String ternos, // '2' ou '3'
    required String period, // 'Dia' ou 'Noite'
    required String dayType, // 'Dia útil', 'Domingo', 'Feriado'
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
    final dayMultipliers = {
      'Dia útil': 1.0,
      'Domingo': 1.2,
      'Feriado': 2.0,
    };
    
    final dayMult = dayMultipliers[dayType]!;
    final periodMult = period == 'Noite' ? 1.5 : 1.0;
    
    if (ternos == '2') {
      // 2 ternos: CHEFE (maior peso) + LINGADA (maior + 60% do menor)
      
      // CHEFE - apenas maior peso
      final chefeValue = ((coef1 * maiorPeso) * mult2 + (coef2 * mult1) * mult2) * 
                         dayMult * periodMult * mult4;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: 'CHEFE',
        value: chefeValue,
        period: period,
      ));
      
      // LINGADA - maior peso + 60% do menor
      final pesoLingada = maiorPeso + (segundoPeso * 0.6);
      final lingadaValue = ((coef1 * pesoLingada) * mult2 + (coef2 * mult1) * mult2) * 
                           dayMult * periodMult * mult4;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: 'LINGADA',
        value: lingadaValue,
        period: period,
      ));
      
    } else {
      // 3 ternos: CHEFE (maior peso) + 3º TERNO (peso do 3º terno)
      
      // CHEFE - apenas maior peso
      final chefeValue = ((coef1 * maiorPeso) * mult2 + (coef2 * mult1) * mult2) * 
                         dayMult * periodMult * mult4;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: 'CHEFE',
        value: chefeValue,
        period: period,
      ));
      
      // 3º TERNO - peso do terceiro terno
      final terceiroValue = ((coef1 * segundoPeso) * mult3 + (coef2 * mult1) * mult3) * 
                            dayMult * periodMult * mult4;
      
      results.add(CalculationResult(
        dayType: dayType,
        calculationType: '3º TERNO',
        value: terceiroValue,
        period: period,
      ));
    }
    
    return results;
  }
}
