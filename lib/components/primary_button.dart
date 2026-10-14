import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  // esse construtor recebe os dados que mudam em cada botão
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 37, 91, 155),  // Cor de fundo
        foregroundColor: Colors.white, // Cor do texto
        // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        fixedSize: const Size(340, 54), //tamanho fixo do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Bordas arredondadas
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
      ),
    );
  }
}
