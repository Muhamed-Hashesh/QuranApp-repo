import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_project/helpers/sized_box.dart';
import 'package:quran_project/views/custom_drawer/pages/custom_drawer.dart';
import 'package:quran_project/views/sebha_screen/cubit/sebha_cubit.dart';
import 'package:quran_project/widgets/custom_appbar.dart';

class TasbihView extends StatelessWidget {
  const TasbihView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'التسبيح الإلكتروني'),
        drawer: CustomDrawer(),
        body: BlocBuilder<TasbihCubit, TasbihState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5DC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.items.length,
                        separatorBuilder: (context, index) =>
                            Divider(height: 1, color: Colors.brown[200]),
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          final isSelected = state.selectedIndex == index;
                          return Container(
                            color: isSelected
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.transparent,
                            child: ListTile(
                              leading: Icon(
                                item.count == item.limit
                                    ? Icons.check
                                    : Icons.close,
                                color: item.count == item.limit
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              title:
                                  Text(item.text, textAlign: TextAlign.right),
                              trailing: Text('${item.count}/${item.limit}'),
                              onTap: () =>
                                  context.read<TasbihCubit>().selectItem(index),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  16.height,
                  Text(
                    state.items[state.selectedIndex].text,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 88,
                      left: 88,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      state.items[state.selectedIndex].count
                          .toString()
                          .padLeft(2, '0'),
                      style: TextStyle(
                        fontFamily: 'Digital',
                        fontSize: 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  16.height,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.refresh, size: 32),
                        onPressed: () =>
                            context.read<TasbihCubit>().resetSelectedCount(),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () =>
                            context.read<TasbihCubit>().incrementCount(),
                        child: Container(
                          width: 128,
                          height: 128,
                          decoration: const BoxDecoration(
                            color: Colors.brown,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
