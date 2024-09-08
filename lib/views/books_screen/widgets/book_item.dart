import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/views/books_screen/pages/pdf_viewer.dart';

class BookItemContainer extends StatelessWidget {
  final String filePath;

  const BookItemContainer({
    super.key,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (filePath.isNotEmpty) {
          Get.to(() => PdfViewer(filePath: filePath));
        } else {
          print('File path is empty');
        }
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 200,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التسبيح في الكتاب والسنة',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'كتاب ماتع يتحدث عن التسبيح في الكتاب والسنة والرد على المفاهيم الخاطئة فيه.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/drawer_header.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          const Text(
            'التسبيح في الكتاب والسنة',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          const Text(
            'كتاب ماتع يتحدث عن التسبيح في الكتاب والسنة والرد على المفاهيم الخاطئة فيه.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
