import 'package:flutter/material.dart';
import 'package:quran/views/books_screen/widgets/book_item.dart';
import 'package:quran/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran/widgets/custom_appbar.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const Customappbar(title: 'الكتب'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => const BookItemContainer(
              filePath:
                  'https://d1.islamhouse.com/data/ar/ih_books/single_010/ar-sunan-qal-al3amal-biha-ppp.pdf', // تأكد من وجود رابط الـ PDF
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
