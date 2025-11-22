class CalculationResult {
  final String dayType; // 'Dia útil', 'Domingo', 'Feriado'
  final String calculationType; // 'CHEFE', 'LINGADA', '3º TERNO'
  final double value;
  final String period; // 'Dia', 'Noite'

  CalculationResult({
    required this.dayType,
    required this.calculationType,
    required this.value,
    required this.period,
  });

  String get formattedValue {
    return 'R\$ ${value.toStringAsFixed(2)}';
  }
}
