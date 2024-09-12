import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/ahadith_screen/cubit/cubit/hadith_cubit.dart';
import 'package:quran_project/views/ahadith_screen/presentation/widgets/hadith_paja_container.dart';

class HadithAnimatedDrop extends StatefulWidget {
  const HadithAnimatedDrop({super.key});

  @override
  State<HadithAnimatedDrop> createState() => _HadithAnimatedDropState();
}

class _HadithAnimatedDropState extends State<HadithAnimatedDrop> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(
      builder: (context, state) {
        if (state is HadithLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HadithLoaded) {
          final ahadithList = state.hadith;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                PajeContainer(ahadithModel: ahadithList[index]),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: ahadithList.length,
          );
        } else if (state is HadithError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox();
      },
    );
  }
}
