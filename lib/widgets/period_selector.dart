import 'package:flutter/material.dart';

class PeriodSelector extends StatelessWidget {
  final String selectedPeriod;
  final Function(String) onPeriodSelected;
  final Color selectedColor;

  const PeriodSelector({
    super.key,
    required this.selectedPeriod,
    required this.onPeriodSelected,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPeriodButton(
            context,
            'Dia',
            selectedPeriod == 'Dia',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildPeriodButton(
            context,
            'Noite',
            selectedPeriod == 'Noite',
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodButton(
    BuildContext context,
    String period,
    bool isSelected,
  ) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : const Color(0xFF2D2D2D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? selectedColor : const Color(0xFF404040),
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: selectedColor.withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onPeriodSelected(period),
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Text(
              period,
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
