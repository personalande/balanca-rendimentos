# Balança de Rendimentos

Aplicativo mobile multiplataforma (Android e iOS) para cálculo de rendimentos portuários.

## 🎯 Funcionalidades

O aplicativo calcula rendimentos para três tipos de carga:

### 1. Celulose
- Seleção de período (Dia/Noite)
- Entrada de maior e menor peso
- **Exibição simultânea** de resultados para:
  - Dia útil
  - Domingo
  - Feriado

### 2. Adubo
- Seleção de período (Dia/Noite)
- Entrada de peso
- **Exibição simultânea** de resultados CHEFE para:
  - Dia útil
  - Domingo
  - Feriado

### 3. Açúcar
- Seleção de configuração (2 ou 3 ternos)
- Seleção de período (Dia/Noite)
- **Seleção obrigatória** de tipo de dia (Dia útil/Domingo/Feriado)
- Entrada de pesos conforme configuração:
  - **2 ternos**: Maior peso + Menor peso → Calcula CHEFE e LINGADA
  - **3 ternos**: Maior peso + Peso do 3º terno → Calcula CHEFE e 3º TERNO

## 🛠 Tecnologia

Desenvolvido em **Flutter** para máxima performance e compatibilidade multiplataforma.

## 📱 Como Executar

### Pré-requisitos
- Flutter SDK instalado
- Android Studio ou Xcode configurado

### Comandos

```bash
# Instalar dependências
flutter pub get

# Executar em modo debug
flutter run

# Build para Android
flutter build apk

# Build para iOS
flutter build ios
```

## 🎨 Design

- Interface minimalista e vibrante
- Fundo grafite/preto
- Cores específicas por carga:
  - **Celulose**: Azul
  - **Adubo**: Verde
  - **Açúcar**: Laranja
- Tipografia moderna sem serifa
- Botões grandes e arredondados
- Cards com elevação e gradientes

## 📐 Fórmulas Implementadas

Todas as fórmulas seguem rigorosamente as especificações fornecidas, com multiplicadores específicos para:
- Tipo de dia (útil, domingo, feriado)
- Período (dia, noite)
- Tipo de cálculo (chefe, lingada, 3º terno)

## 📂 Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada
├── theme/
│   └── app_theme.dart          # Design system
├── models/
│   └── calculation_result.dart # Modelo de dados
├── services/
│   ├── celulose_calculator.dart
│   ├── adubo_calculator.dart
│   └── acucar_calculator.dart
├── screens/
│   ├── home_screen.dart
│   ├── celulose/
│   ├── adubo/
│   └── acucar/
└── widgets/
    ├── cargo_button.dart
    ├── period_selector.dart
    ├── input_field.dart
    └── result_card.dart
```
