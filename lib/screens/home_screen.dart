import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/cargo_button.dart';
import 'celulose/celulose_period_screen.dart';
import 'adubo/adubo_period_screen.dart';
import 'acucar/acucar_ternos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo/Título
              const Icon(
                Icons.anchor,
                size: 80,
                color: Color(0xFF2196F3),
              ),
              const SizedBox(height: 16),
              const Text(
                'Balança de\nRendimentos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 60),

              // Botão Celulose
              CargoButton(
                label: 'CELULOSE',
                icon: Icons.inventory_2,
                gradient: AppTheme.getCeluloseGradient(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CelulosePeriodScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Botão Adubo
              CargoButton(
                label: 'ADUBO',
                icon: Icons.grass,
                gradient: AppTheme.getAduboGradient(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AduboPeriodScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Botão Açúcar
              CargoButton(
                label: 'AÇÚCAR',
                icon: Icons.grain,
                gradient: AppTheme.getAcucarGradient(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AcucarTernosScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
