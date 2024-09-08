// import 'package:flutter/material.dart';
// import 'package:quran/helpers/sized_box.dart';
//
// class ContentVideo extends StatelessWidget {
//   const ContentVideo({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.speaker,
//   });
//
//   final String title;
//   final String subtitle;
//   final String speaker;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//               color: Theme.of(context).colorScheme.primary,
//             ),
//             textDirection: TextDirection.rtl,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w700,
//               color: Theme.of(context).colorScheme.onSurface,
//             ),
//             textDirection: TextDirection.rtl,
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 speaker,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//               ),
//               8.width,
//               CircleAvatar(
//                 backgroundColor: Colors.grey[300],
//                 radius: 20,
//                 child: Icon(Icons.person, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
