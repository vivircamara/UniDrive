import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Botão de largura total, usado em "Configuração de veículo" (texto à
/// esquerda + ícone) e "Logout" (texto centralizado).
class WideButton extends StatelessWidget {
  const WideButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.icon,
    this.centered = false,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.height = 54,
    this.horizontalMargin = 0,
  });

  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool centered;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: centered
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
              if (icon != null) Icon(icon, size: 26),
            ],
          ),
        ),
      ),
    );
  }
}