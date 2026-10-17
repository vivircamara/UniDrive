import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Seletor de abas "Solicitar" / "Carona".
/// A aba ativa é preenchida em azul; a inativa fica com sublinhado.
class HomeTabSwitcher extends StatelessWidget {
  final TabController controller;

  const HomeTabSwitcher({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animation!,
      builder: (context, _) {
        return Row(
          children: [
            Expanded(
              child: _TabButton(
                label: 'Solicitar',
                icon: Icons.location_on,
                selected: controller.index == 0,
                onTap: () => controller.animateTo(0),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _TabButton(
                label: 'Carona',
                icon: Icons.directions_car_filled,
                selected: controller.index == 1,
                onTap: () => controller.animateTo(1),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fg = selected ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        decoration: BoxDecoration(
          color: selected ? AppColors.colorPrimary : Colors.transparent,
          border: selected
              ? null
              : const Border(
                  bottom: BorderSide(color: AppColors.colorPrimary, width: 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: fg),
            const SizedBox(width: 8),
            Text(label,
                style: TextStyle(
                    color: fg, fontWeight: FontWeight.w600, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}