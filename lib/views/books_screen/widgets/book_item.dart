import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/books_screen/pages/pdf_viewer.dart';
import 'package:quran_project/views/every_types_screen/models/all_media_model.dart';

class BookItemContainer extends StatelessWidget {
  final String filePath;
  final Data data;
  final PreparedBy preparedBy;
  final Attachments attachments;

  const BookItemContainer({
    super.key,
    required this.filePath,
    required this.data,
    required this.preparedBy,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (filePath.isNotEmpty) {
          Get.to(() => PdfViewer(
                filePath: filePath,
                topic: data.title ?? 'no topic',
              ));
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
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to take the content size
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adapts to content size
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
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
