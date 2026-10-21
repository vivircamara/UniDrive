import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import '../components/inputs/input_text.dart';
import '../components/inputs/input_select.dart';
import '../components/inputs/input_password.dart';
import '../components/inputs/input_date.dart';
import '../components/button/primary_button.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _registrationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _campusNameController = TextEditingController();

  String? _shift;
  String? _gender;
  String? _campus;
  DateTime? _birthDate;

  @override
  void dispose() {
    _emailController.dispose();
    _registrationController.dispose();
    _passwordController.dispose();
    _campusNameController.dispose();
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
      backgroundColor: AppColors.colorWhite,
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
                  padding: const EdgeInsets.only(left: 5, top: 20, bottom:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fazer Cadastro',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.colorSecondary,
                        ),
                      ),
                      Text(
                        'Rápido, seguro e fácil',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.subtitle,
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
                InputText(
                  controller: _registrationController,
                  hintText: 'Matrícula',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: _required,
                ),
                const SizedBox(height: 12),
                InputSelect(
                  hintText: 'Turno',
                  value: _shift,
                  items: const ['Matutino', 'Vespertino', 'Noturno'],
                  onChanged: (v) => setState(() => _shift = v),
                  validator: _required,
                ),
                const SizedBox(height: 12),
                InputPassword(
                  controller: _passwordController,
                  validator: _required,
                ),
                const SizedBox(height: 12),

                // Gênero + Data de nascimento
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InputSelect(
                        hintText: 'Gênero',
                        value: _gender,
                        items: const ['Feminino', 'Masculino', 'Outro'],
                        onChanged: (v) => setState(() => _gender = v),
                        validator: _required,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: InputDate(
                        initialDate: _birthDate,
                        onChanged: (d) => _birthDate = d,
                        validator: _required,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Campus + Nome
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InputSelect(
                        hintText: 'Campus',
                        value: _campus,
                        items: const ['Ceilândia', 'ESCS', 'Lago Norte'],
                        onChanged: (v) => setState(() => _campus = v),
                        validator: _required,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: InputText(
                        controller: _campusNameController,
                        hintText: 'Bairro',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Center(
                  child: PrimaryButton(
                    label: 'Criar Conta',
                  
                    onPressed: _submit,
                  ),
                ),
                // PrimaryButton(label: 'Criar Conta', onPressed: _submit),
                const SizedBox(height: 40),

                // Rodapé
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Text.rich(
                      TextSpan(
                        text: 'Já tem uma conta? ',
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.subtitle,
                        ),
                        children: [
                          TextSpan(
                            text: 'Entrar',
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