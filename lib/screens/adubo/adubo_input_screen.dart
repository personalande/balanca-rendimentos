import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import 'adubo_results_screen.dart';

class AduboInputScreen extends StatefulWidget {
  final String period;

  const AduboInputScreen({
    super.key,
    required this.period,
  });

  @override
  State<AduboInputScreen> createState() => _AduboInputScreenState();
}

class _AduboInputScreenState extends State<AduboInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();

  @override
  void dispose() {
    _pesoController.dispose();
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
      final peso = double.parse(_pesoController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AduboResultsScreen(
            peso: peso,
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
        title: const Text('Adubo - Peso'),
        backgroundColor: const Color(0xFF4CAF50),
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
                    color: const Color(0xFF4CAF50).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF4CAF50),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Período: ${widget.period}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4CAF50),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                InputField(
                  label: 'Peso',
                  hint: 'Digite o peso',
                  controller: _pesoController,
                  validator: _validatePeso,
                ),
                
                const Spacer(),
                
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
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
