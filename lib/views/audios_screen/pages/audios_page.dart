import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/helpers/sized_box.dart';
import 'package:quran/views/audios_screen/widgets/audio_page_content.dart';
import 'package:quran/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_cubit.dart';
import 'package:quran/views/every_types_screen/cubit/all_media_cubit/all_media_state.dart';
import 'package:quran/views/every_types_screen/models/all_media_model.dart';
import 'package:quran/widgets/custom_appbar.dart';

class AudiosPage extends StatelessWidget {
  const AudiosPage({super.key});
  // final AllMediaModel allMediaModel = AllMediaModel();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'الصوتيات'),
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
                return ListView.separated(
                  itemBuilder: (context, index) => AudiosPageContent(
                    data: dataList[index],
                    dataIndex: index,
                    count: dataList[index].attachments!.length,
                  ),
                  separatorBuilder: (context, index) => 16.height,
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
