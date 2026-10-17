import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Campo arredondado usado em "Para onde?" / "De onde?".
class InputSearchWhere extends StatelessWidget {
  final Widget leading;
  final String hint;
  final VoidCallback? onTap;
  final bool boldHint;

  const InputSearchWhere({
    super.key,
    required this.leading,
    required this.hint,
    this.onTap,
    this.boldHint = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.colorSecondary),
        ),
        child: Row(
          children: [
            SizedBox(width: 28, child: leading),
            const SizedBox(width: 24),
            Text(hint,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: boldHint ? FontWeight.w600 : FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}