import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'input_text.dart';

/// Campo de data com ícone de calendário e seletor (DatePicker).
class InputDate extends StatefulWidget {
  const InputDate({
    super.key,
    this.initialDate,
    this.onChanged,
    this.validator,
  });

  final DateTime? initialDate;
  final ValueChanged<DateTime>? onChanged;
  final String? Function(String?)? validator;

  @override
  State<InputDate> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<InputDate> {
  late final TextEditingController _controller;
  DateTime? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialDate;
    _controller = TextEditingController(
      text: _selected != null ? _format(_selected!) : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _format(DateTime d) =>
      '${d.day.toString().padLeft(2, '0')}/'
      '${d.month.toString().padLeft(2, '0')}/'
      '${d.year}';

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selected ?? DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selected = picked;
        _controller.text = _format(picked);
      });
      widget.onChanged?.call(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InputText(
      controller: _controller,
      hintText: 'dd/mm/aaaa',
      readOnly: true,
      onTap: _pickDate,
      validator: widget.validator,
      suffixIcon: IconButton(
        onPressed: _pickDate,
        icon: const Icon(
          Icons.calendar_today_outlined,
          color: AppColors.colorPrimary,
          size: 22,
        ),
      ),
    );
  }
}