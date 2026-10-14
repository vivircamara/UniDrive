// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// import '../theme/app_colors.dart';

// /// Mapa ilustrativo com marcador e círculos de precisão.
// /// Para um mapa real, substitua o CustomPaint por google_maps_flutter / flutter_map.
// class MapPlaceholder extends StatelessWidget {
//   const MapPlaceholder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         CustomPaint(painter: _StreetsPainter()),
//         Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               _circle(220, AppColors.colorPrimary.withOpacity(0.12)),
//               _circle(150, AppColors.colorPrimary.withOpacity(0.18)),
//               _circle(72, AppColors.colorPrimary.withOpacity(0.35)),
//               Container(
//                 width: 28,
//                 height: 28,
//                 decoration: const BoxDecoration(
//                     color: Color(0xFFB9C7DE), shape: BoxShape.circle),
//                 child: const Icon(Icons.location_on,
//                     size: 18, color: AppColors.colorPrimary),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _circle(double size, Color color) => Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//       );
// }

// class _StreetsPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawRect(Offset.zero & size, Paint()..color = AppColors.mapBg);

//     final road = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 7
//       ..strokeCap = StrokeCap.round;
//     final thin = Paint()
//       ..color = Colors.white
//       ..strokeWidth = 3;
//     final river = Paint()
//       ..color = const Color(0xFFBFDCDD)
//       ..strokeWidth = 8;

//     canvas.drawLine(Offset(0, size.height * .36),
//         Offset(size.width, size.height * .5), river);

//     for (var i = -2; i < 8; i++) {
//       final x = size.width * i / 5;
//       canvas.drawLine(Offset(x, 0),
//           Offset(x + size.height * .35, size.height), i.isEven ? road : thin);
//     }
//     for (var j = 0; j < 9; j++) {
//       final y = size.height * j / 8;
//       canvas.drawLine(Offset(0, y + math.sin(j) * 10),
//           Offset(size.width, y - 30), j.isOdd ? road : thin);
//     }

//     canvas.drawCircle(Offset(size.width * .08, size.height * .38), 34,
//         Paint()..color = const Color(0xFFD7E6CC));
//     canvas.drawCircle(Offset(size.width * .92, size.height * .22), 30,
//         Paint()..color = const Color(0xFFE0EBD2));
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }