import 'package:flutter/material.dart';
import 'acucar_period_screen.dart';

class AcucarTernosScreen extends StatefulWidget {
  const AcucarTernosScreen({super.key});

  @override
  State<AcucarTernosScreen> createState() => _AcucarTernosScreenState();
}

class _AcucarTernosScreenState extends State<AcucarTernosScreen> {
  String? selectedTernos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Açúcar'),
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
              const Text(
                'Selecione a configuração',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              
              _buildTernosButton('2', '2 Ternos'),
              const SizedBox(height: 16),
              _buildTernosButton('3', '3 Ternos'),
              
              const Spacer(),
              
              ElevatedButton(
                onPressed: selectedTernos != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcucarPeriodScreen(
                              ternos: selectedTernos!,
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

  Widget _buildTernosButton(String value, String label) {
    final isSelected = selectedTernos == value;
    
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF9800) : const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? const Color(0xFFFF9800) : const Color(0xFF404040),
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xFFFF9800).withOpacity(0.4),
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
              selectedTernos = value;
            });
          },
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              label,
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
