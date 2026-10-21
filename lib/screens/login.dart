import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/button/primary_button.dart';
import '../components/inputs/input_text.dart';
import '../components/inputs/input_password.dart';
import '../theme/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

    @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _shift;
  

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Campo obrigatório' : null;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // TODO: chamar a API de cadastro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               
              children: [
                // Botão voltar
                TextButton.icon(
                  onPressed: () => Navigator.maybePop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.text,
                    padding: EdgeInsets.zero,
                  ),
                  icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                  label: Text(
                    'Voltar',
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                ),

                // Logo
                Center(
                  child: Image.asset(
                    'assets/imagens/logo.png',
                    width: 108,
                    height: 108,
                  ),
                ),

                // Títulos
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 30, bottom:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Faça login com seu email institucional',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorSecondary,
                        ),
                      ),
                     
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Campos
                InputText(
                  controller: _emailController,
                  hintText: 'E-mail institucional',
                  keyboardType: TextInputType.emailAddress,
                  validator: _required,
                ),
               
                const SizedBox(height: 12),
                InputPassword(
                  controller: _passwordController,
                  validator: _required,
                ),
                
                const SizedBox(height: 28),
                Center(
                  child: PrimaryButton(
                    label: 'Entrar',
                  
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                ),
                
                const SizedBox(height: 40),

                // Rodapé
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/cadastro'),
                    child: Text.rich(
                      TextSpan(
                        text: 'Não tem conta ainda? ',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.subtitle,
                        ),
                        children: [
                          TextSpan(
                            text: 'Criar Conta',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              color: AppColors.colorSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}