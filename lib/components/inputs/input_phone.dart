import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';
import 'input_text.dart';

/// Campo de telefone com seletor de código do país (+55) e divisória.
class InputPhone extends StatelessWidget {
  const InputPhone({
    super.key,
    required this.countryCode,
    required this.onCountryChanged,
    this.controller,
    this.countryCodes = const ['+55', '+1', '+351', '+54'],
    this.hintText = '(00) 0 0000-0000',
  });

  final TextEditingController? controller;
  final String countryCode;
  final List<String> countryCodes;
  final ValueChanged<String?> onCountryChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.montserrat(fontSize: 16, color: AppColors.text);

    return Container(
      height: 61,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Código do país
          SizedBox(
            width: 96,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: countryCode,
                isExpanded: true,
                padding: const EdgeInsets.only(left: 12, right: 8),
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.text,
                ),
                style: style,
                onChanged: onCountryChanged,
                items: countryCodes
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
              ),
            ),
          ),
          Container(width: 1, height: 32, color: AppColors.border),

          // Número
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              // TODO: aplicar máscara (ex.: pacote mask_text_input_formatter).
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9()\-\s]')),
              ],
              style: style,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  color: AppColors.subtitle,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}