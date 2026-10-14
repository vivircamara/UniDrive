import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Botão com contorno (ex.: "Entrar").
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          // foregroundColor: const Color.fromARGB(255, 0, 1, 1),
          fixedSize: const Size(340, 54), //tamanho fixo do botão
          side: const BorderSide(color: Color.fromARGB(255, 0, 1, 1), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}