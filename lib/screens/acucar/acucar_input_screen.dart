import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import 'acucar_results_screen.dart';

class AcucarInputScreen extends StatefulWidget {
  final String ternos;
  final String period;
  final String dayType;

  const AcucarInputScreen({
    super.key,
    required this.ternos,
    required this.period,
    required this.dayType,
  });

  @override
  State<AcucarInputScreen> createState() => _AcucarInputScreenState();
}

class _AcucarInputScreenState extends State<AcucarInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _maiorPesoController = TextEditingController();
  final _segundoPesoController = TextEditingController();

  @override
  void dispose() {
    _maiorPesoController.dispose();
    _segundoPesoController.dispose();
    super.dispose();
  }

  String? _validatePeso(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    final peso = double.tryParse(value);
    if (peso == null || peso <= 0) {
      return 'Peso inválido';
    }
    return null;
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final maiorPeso = double.parse(_maiorPesoController.text);
      final segundoPeso = double.parse(_segundoPesoController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AcucarResultsScreen(
            maiorPeso: maiorPeso,
            segundoPeso: segundoPeso,
            ternos: widget.ternos,
            period: widget.period,
            dayType: widget.dayType,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final is2Ternos = widget.ternos == '2';
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Açúcar - Pesos'),
        backgroundColor: const Color(0xFFFF9800),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                      _buildInfoRow('Tipo de dia', widget.dayType),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                InputField(
                  label: 'Maior Peso',
                  hint: 'Digite o maior peso',
                  controller: _maiorPesoController,
                  validator: _validatePeso,
                ),
                const SizedBox(height: 24),
                
                InputField(
                  label: is2Ternos ? 'Menor Peso' : 'Peso do 3º Terno',
                  hint: is2Ternos 
                      ? 'Digite o menor peso' 
                      : 'Digite o peso do 3º terno',
                  controller: _segundoPesoController,
                  validator: _validatePeso,
                ),
                
                const Spacer(),
                
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Calcular'),
                ),
              ],
            ),
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
}
