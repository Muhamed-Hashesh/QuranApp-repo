import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/views/books_screen/widgets/book_item.dart';
import 'package:quran/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_state.dart';
import 'package:quran/widgets/custom_appbar.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<AllMediaCubit, AllMediaState>(
            builder: (context, state) {
              if (state is AllMediaLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AllMediaDataLoaded) {
                final dataList =
                    context.read<AllMediaCubit>().allMediaModel.data;
                final dsd = context
                    .read<AllMediaCubit>()
                    .allMediaModel
                    .data![0]
                    .attachments![0]
                    .mediaUrl;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) => BookItemContainer(
                    filePath:
                        dataList[index].attachments![0].mediaUrl.toString(),
                    data: dataList[index],
                    preparedBy: dataList[index].preparedBy![0],
                    attachments: dataList[index].attachments![0],
                  ),
                  itemCount: dataList!.length,
                );
              } else {
                return const Center(
                  child: Text('Error in loading ,baby'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
