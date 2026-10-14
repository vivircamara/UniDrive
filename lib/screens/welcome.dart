import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/primary_button.dart';
import '../components/secondary_button.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  static const Color _titleColor = Color(0xFF282D56);
  static const Color _subtitleColor = Color(0xFF8E8E93);

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Center( // 1. Adicionado Center para garantir a centralização horizontal
        child: SingleChildScrollView( // 2. Boa prática: evita erro de overflow em telas pequenas
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 3. Alinha tudo verticalmente no CENTRO
              crossAxisAlignment: CrossAxisAlignment.center, // 4. Alinha tudo horizontalmente no CENTRO
              children: [
                // Logo
                Image.asset(
                  'assets/imagens/logo.png',
                  width: 320,
                  height: 320,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 32),

                Text(
                  'Bem-vindo ao UniDrive!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: _titleColor,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  'Solicite ou ofereça uma\ncarona. É rápido, seguro e fácil.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                    color: _subtitleColor,
                  ),
                ),

                const SizedBox(height: 48), 

                PrimaryButton(
                  label: 'Entrar',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),

                const SizedBox(height: 16),

                SecondaryButton(
                  label: 'Criar conta',
                  onPressed: () {
                    Navigator.pushNamed(context, '/cadastro');

                  },
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}