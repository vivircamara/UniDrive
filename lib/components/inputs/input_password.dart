import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'input_text.dart';

/// Campo de senha com botão para mostrar/ocultar (ícone de olho).
class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    this.controller,
    this.hintText = 'Senha',
    this.validator,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  State<InputPassword> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<InputPassword> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return InputText(
      controller: widget.controller,
      hintText: widget.hintText,
      obscureText: _obscure,
      validator: widget.validator,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _obscure = !_obscure),
        icon: Icon(
          _obscure
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.subtitle,
          size: 20,
        ),
      ),
    );
  }
}