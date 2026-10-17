import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Foto de perfil circular com o selo de câmera no canto inferior direito.
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.image,
    this.size = 130,
    this.onEdit,
  });

  
  /// Se for null, mostra um ícone de pessoa.
  final ImageProvider? image;
  final double size;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Positioned.fill(
            child: CircleAvatar(
              backgroundColor: AppColors.border,
              backgroundImage: image, // Ex.: NetworkImage(url) ou AssetImage('assets/imagens/perfil.png').
              child: image == null
                  ? Icon(Icons.person, size: size * 0.5, color: Colors.white)
                  : null,
            ),
          ),
          Positioned(
            right: 6,
            bottom: 14,
            child: GestureDetector(
              onTap: onEdit,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: AppColors.colorTerciary,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Icon(
                  Icons.photo_camera,
                  size: 11,
                  color: AppColors.colorSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}