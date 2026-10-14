import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NavItem {
  final IconData icon;
  final String label;
  const NavItem(this.icon, this.label);
}

/// Barra de navegação flutuante, arredondada e com sombra.
class NavFloating extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavFloating({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const items = [
    NavItem(Icons.home_rounded, 'Home'),
    NavItem(Icons.directions_car_filled, 'Descubra'),
    NavItem(Icons.history_rounded, 'Histórico'),
    NavItem(Icons.person_rounded, 'Conta'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.colorTerciary),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (var i = 0; i < items.length; i++)
              _NavButton(
                item: items[i],
                selected: i == currentIndex,
                onTap: () => onTap(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final NavItem item;
  final bool selected;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.colorSecondary : AppColors.colorPrimary;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, color: color, size: 28),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: TextStyle(
                color: selected ? AppColors.colorSecondary : color,
                fontSize: 12,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}