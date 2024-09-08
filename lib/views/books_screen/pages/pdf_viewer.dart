import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:quran/widgets/custom_appbar.dart';

class PdfViewer extends StatefulWidget {
  final String filePath;

  const PdfViewer({super.key, required this.filePath});

  @override
  PdfViewerState createState() => PdfViewerState();
}

class PdfViewerState extends State<PdfViewer> {
  bool _isLoading = true;
  int _progress = 0;
  String? _localFilePath;
  final CancelToken _cancelToken = CancelToken();

  @override
  void initState() {
    super.initState();
    _downloadFile(widget.filePath);
  }

  @override
  void dispose() {
    _cancelToken.cancel();
    super.dispose();
  }

  Future<void> _downloadFile(String url) async {
    try {
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/temp.pdf';

      await dio.download(
        url,
        filePath,
        cancelToken: _cancelToken,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            if (mounted) {
              setState(() {
                _progress = ((received / total) * 100).toInt();
              });
            }
          }
        },
      );

      if (mounted) {
        setState(() {
          _isLoading = false;
          _localFilePath = filePath;
        });
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        print('Download canceled');
      } else {
        print('Error downloading file: ${e.message}');
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Unexpected error: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(title: 'التسبيح من الكتاب والسنة'),
        body: _isLoading
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('تحميل... $_progress%'),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: LinearProgressIndicator(
                        value: _progress / 100,
                      ),
                    ),
                  ],
                ),
              )
            : _localFilePath == null
                ? const Center(
                    child: Text('لم يتم تحميل الملف.'),
                  )
                : PDFView(
                    filePath: _localFilePath,
                    // enableSwipe: true,
                    // swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                    onError: (error) {
                      print(error.toString());
                    },
                    onPageError: (page, error) {
                      print('$page: ${error.toString()}');
                    },
                  ),
      ),
    );
  }
}
