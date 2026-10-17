import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'button/small_button.dart';

/// Dados da viagem em destaque (card com mapa).
class LastTrip {
  final String title;
  final String dateTime; // Ex.: "10 out. 2026 - 20:00"
  final String price; // Ex.: "R$25,00"
  final String? mapAsset; // Ex.: "assets/imagens/map.png"

  const LastTrip({
    required this.title,
    required this.dateTime,
    required this.price,
    this.mapAsset,
  });
}

/// Card de destaque com o mapa da última viagem e o botão "Reagendar".
class LastTripCard extends StatelessWidget {
  final LastTrip trip;
  final VoidCallback? onRebook;

  const LastTripCard({super.key, required this.trip, this.onRebook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mapa [aqui entra o mapa vindo de uma api]
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 122,
              width: double.infinity,
              child: trip.mapAsset != null
                  ? Image.asset(
                      trip.mapAsset!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _mapPlaceholder(),
                    )
                  : _mapPlaceholder(),
            ),
          ),
          const SizedBox(height: 12),

          // Informações + botão
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      trip.dateTime,
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: AppColors.subtitle,
                      ),
                    ),
                    Text(
                      trip.price,
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: AppColors.subtitle,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
              
                child: SmallButton(
                  label: 'Reagendar',
                  icon: Icons.replay,
                  height: 36,
                  radius: 24,
                  fontSize: 13,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  onPressed: onRebook,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mapPlaceholder() => Container(
        color: const Color(0xFF1F2350),
        child: const Center(
          child: Icon(Icons.map_outlined, color: Colors.white54, size: 36),
        ),
      );
}