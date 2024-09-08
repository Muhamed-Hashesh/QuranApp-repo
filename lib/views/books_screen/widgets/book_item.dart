import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/books_screen/pages/pdf_viewer.dart';
import 'package:quran/views/every_types_screen/models/all_media_model.dart';

class BookItemContainer extends StatelessWidget {
  final String filePath;

  const BookItemContainer({
    super.key,
    required this.filePath,
    required this.data,
    required this.preparedBy,
    required this.attachments,
  });
  final Data data;
  final PreparedBy preparedBy;
  final Attachments attachments;

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
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            data.title.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            '${data.description}',
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
                  data.title.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                16.height,
                Text(
                  data.description.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                16.height,
                Text(
                  preparedBy.title ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                8.height,
                Text(
                  preparedBy.description ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                24.height,
                Text(
                  attachments.size ?? '',
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
