import 'package:flutter/material.dart';
import 'acucar_input_screen.dart';

class AcucarDayTypeScreen extends StatefulWidget {
  final String ternos;
  final String period;

  const AcucarDayTypeScreen({
    super.key,
    required this.ternos,
    required this.period,
  });

  @override
  State<AcucarDayTypeScreen> createState() => _AcucarDayTypeScreenState();
}

class _AcucarDayTypeScreenState extends State<AcucarDayTypeScreen> {
  String? selectedDayType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Açúcar - Tipo de Dia'),
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
                  color: const Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Ternos', widget.ternos),
                    _buildInfoRow('Período', widget.period),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Selecione o tipo de dia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              
              _buildDayTypeButton('Dia útil', const Color(0xFF00BCD4)),
              const SizedBox(height: 16),
              _buildDayTypeButton('Domingo', const Color(0xFF9C27B0)),
              const SizedBox(height: 16),
              _buildDayTypeButton('Feriado', const Color(0xFFE91E63)),
              
              const Spacer(),
              
              ElevatedButton(
                onPressed: selectedDayType != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcucarInputScreen(
                              ternos: widget.ternos,
                              period: widget.period,
                              dayType: selectedDayType!,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF404040),
                ),
                child: const Text('Continuar'),
              ),
            ],
          ),
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

  Widget _buildDayTypeButton(String dayType, Color color) {
    final isSelected = selectedDayType == dayType;
    
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: isSelected ? color : const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? color : const Color(0xFF404040),
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              selectedDayType = dayType;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              dayType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF707070),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
