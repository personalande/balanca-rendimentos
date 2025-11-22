import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import 'celulose_results_screen.dart';

class CeluloseInputScreen extends StatefulWidget {
  final String period;

  const CeluloseInputScreen({
    super.key,
    required this.period,
  });

  @override
  State<CeluloseInputScreen> createState() => _CeluloseInputScreenState();
}

class _CeluloseInputScreenState extends State<CeluloseInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _maiorPesoController = TextEditingController();
  final _menorPesoController = TextEditingController();

  @override
  void dispose() {
    _maiorPesoController.dispose();
    _menorPesoController.dispose();
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
      final menorPeso = double.parse(_menorPesoController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CeluloseResultsScreen(
            maiorPeso: maiorPeso,
            menorPeso: menorPeso,
            period: widget.period,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celulose - Pesos'),
        backgroundColor: const Color(0xFF2196F3),
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
                    color: const Color(0xFF2196F3).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2196F3).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF2196F3),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Período: ${widget.period}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF2196F3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
                  label: 'Menor Peso',
                  hint: 'Digite o menor peso',
                  controller: _menorPesoController,
                  validator: _validatePeso,
                ),
                
                const Spacer(),
                
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
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
}
