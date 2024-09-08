import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran/helpers/sized_box.dart';
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
        buildShowModalBottomSheet(context);
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

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            // color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/drawer_header.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                16.height,
                Text(
                  'التسبيح في الكتاب والسنة',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                16.height,
                Text(
                  'كتاب ماتع يتحدث عن التسبيح في الكتاب والسنة والرد على المفاهيم الخاطئة فيه.',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                16.height,
                Text(
                  'محمد إسحاق كندو',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                8.height,
                Text(
                  'خريج قسم العقيدة بالجامعة الإسلامية بالمدينة النبوية، رئيس مجلس علماء أهل السنة في بوركينا فاسو، وأبرز الدعاة في الوقت الحاضر في بوركينا فاسو.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                24.height,
                const Text(
                  '18.94 MB',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
