import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/views/azkar_screen/cubit/cubit/azkar_cubit.dart';
import 'package:quran_project/views/azkar_screen/widgets/reach_text_reqaa.dart';
import 'package:quran_project/widgets/paje_container.dart';

class AzkarAnimatedDrop extends StatefulWidget {
  final int typeId;

  const AzkarAnimatedDrop({super.key, required this.typeId});

  @override
  _AzkarAnimatedDropState createState() => _AzkarAnimatedDropState();
}

class _AzkarAnimatedDropState extends State<AzkarAnimatedDrop> {
  late List<int> repeatCounts;

  @override
  void initState() {
    super.initState();
    repeatCounts = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        if (state is AzkarLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AzkarLoaded) {
          final azkarList = state.azkar;
          if (repeatCounts.length != azkarList.length) {
            repeatCounts = List.filled(azkarList.length, 0);
          }
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (repeatCounts[index] < azkarList[index].repeat) {
                      setState(() {
                        repeatCounts[index]++;
                      });
                    }
                  },
                  child: PajeContainer(azkarModel: azkarList[index]),
                ),
                ReachTextReqaa(
                  azkarModel: azkarList[index],
                  repeatCount: repeatCounts[index],
                ),
              ],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: azkarList.length,
          );
        } else if (state is AzkarError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox();
      },
    );
  }
}
