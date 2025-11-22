import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Cores principais
  static const Color backgroundColor = Color(0xFF1A1A1A); // Grafite escuro
  static const Color cardBackground = Color(0xFF2D2D2D);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0B0);

  // Cores por tipo de carga
  static const Color celuloseColor = Color(0xFF2196F3); // Azul vibrante
  static const Color aduboColor = Color(0xFF4CAF50); // Verde vibrante
  static const Color acucarColor = Color(0xFFFF9800); // Laranja vibrante

  // Cores de resultado
  static const Color diaUtilColor = Color(0xFF00BCD4); // Ciano
  static const Color domingoColor = Color(0xFF9C27B0); // Roxo
  static const Color feriadoColor = Color(0xFFE91E63); // Rosa

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,

      // Tipografia moderna com Montserrat (similar à Gotham)
      fontFamily: GoogleFonts.montserrat().fontFamily,
      textTheme: GoogleFonts.montserratTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textPrimary,
            letterSpacing: -0.5,
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: textPrimary,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: textSecondary,
          ),
        ),
      ),

      // Estilo de cards
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 8,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Estilo de botões
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 6,
          textStyle: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Estilo de inputs
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF404040), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        labelStyle: GoogleFonts.montserrat(color: textSecondary),
        hintStyle: GoogleFonts.montserrat(color: const Color(0xFF707070)),
      ),
    );
  }

  // Gradientes para botões
  static LinearGradient getCeluloseGradient() {
    return const LinearGradient(
      colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getAduboGradient() {
    return const LinearGradient(
      colors: [Color(0xFF4CAF50), Color(0xFF388E3C)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getAcucarGradient() {
    return const LinearGradient(
      colors: [Color(0xFFFF9800), Color(0xFFF57C00)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
