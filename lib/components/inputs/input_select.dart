import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';
import 'input_text.dart';

/// Campo de seleção (dropdown) reutilizável.
class InputSelect extends StatelessWidget {
  const InputSelect({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText,
    this.validator,
  });

  final List<String> items;
  final String? value;
  final String? hintText;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      isExpanded: true,
      validator: validator,
      onChanged: onChanged,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.subtitle,
      ),
      style: GoogleFonts.montserrat(
        fontSize: 16,
        color: AppColors.text,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 16,
          color: AppColors.subtitle,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        enabledBorder: InputText.buildBorder(),
        focusedBorder: InputText.buildBorder(AppColors.colorPrimary),
        errorBorder: InputText.buildBorder(Colors.red),
        focusedErrorBorder: InputText.buildBorder(Colors.red),
      ),
      items: items
          .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
          .toList(),
    );
  }
}