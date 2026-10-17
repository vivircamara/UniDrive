import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'button/small_button.dart';

/// Dados de uma viagem disponível.
class Trip {
  final String title;
  final String location;
  final String date;
  final String time;
  final String? price; 

  const Trip({
    required this.title,
    required this.location,
    required this.date,
    required this.time,
     this.price,
  });
}

/// Componente de detalhes da viagem disponível.
class TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback? onCheck;
  final String buttonLabel;


  const TripCard({
    super.key, 
    required this.trip, 
    this.onCheck, 
   this.buttonLabel = 'Conferir',
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 0.8)),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.colorTerciary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/imagens/carIcon.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(trip.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w800)),
                Text(trip.location,
                    style: const TextStyle(
                        fontSize: 13, color: AppColors.subtitle)),
                const SizedBox(height: 2),
                if (trip.price != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    trip.price!,
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.colorSecondary,
                        fontWeight: FontWeight.w700),
                  ),
                ],

                // ↓ Row antigo substituído por Wrap ↓
                Wrap(
                  spacing: 14, // espaço entre data e hora
                  runSpacing: 2, // espaço se o horário descer para a linha de baixo
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_today, size: 12, color: AppColors.colorSecondary),
                        const SizedBox(width: 4),
                        Text(trip.date, style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.access_time_filled, size: 12, color: AppColors.colorSecondary),
                        const SizedBox(width: 4),
                        Text(trip.time, style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            // width: 144.5,
            child: SmallButton(
              label: buttonLabel,
              onPressed: onCheck,
              radius: 24,
              height: 40,
              fontSize: 13,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          
        ],
      ),
    );
  }
}