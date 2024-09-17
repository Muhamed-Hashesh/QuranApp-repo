import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran_project/views/every_types_screen/cubit/all_media_cubit/all_media_state.dart';
import '../../../widgets/custom_appbar.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import '../widgets/video_card.dart';

class VideoListViewScreen extends StatelessWidget {
  const VideoListViewScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllMediaCubit>();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(title: title),
        drawer: CustomDrawer(),
        body: BlocBuilder<AllMediaCubit, AllMediaState>(
          builder: (context, state) {
            if (state is AllMediaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AllMediaDataLoaded) {
              final dataList = context.read<AllMediaCubit>().allMediaModel.data;
              return ListView.builder(
                itemCount: dataList!.length,
                itemBuilder: (context, index) {
                  return CardVideosListView(
                    data: dataList[index],
                    // preparedBy: dataList[index].preparedBy![0],
                    attachments: dataList[index].attachments![0],
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Error in loading ,baby'),
              );
            }
          },
        ),
      ),
    );
  }
}
