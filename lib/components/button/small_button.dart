import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Botão principal (preenchido) ou secundário (contornado).
class SmallButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool outlined;
  final IconData? icon;
  final double height;
  final double width;
  final double radius;
  final double fontSize;
  final EdgeInsetsGeometry? padding;

  const SmallButton({
    super.key,
    required this.label,
    this.onPressed,
    this.outlined = false,
    this.icon,
    this.height = 48,
    this.width = 144.5,
    this.radius = 8,
    this.fontSize = 16,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    );
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 18), const SizedBox(width: 8)],
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ],
    );

    return SizedBox(
      height: height,
      width: width,
      child: outlined
          ? OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.colorSecondary,
                side: const BorderSide(color: AppColors.border),
                padding: padding,
                shape: shape,
              ),
              child: child,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorPrimary,
                foregroundColor: Colors.white,
                padding: padding,
                elevation: 0,
                shape: shape,
              ),
              child: child,
            ),
    );
  }
}