import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          return ListTile(
                            leading: Icon(
                              item.count == item.limit
                                  ? Icons.check
                                  : Icons.close,
                              color: item.count == item.limit
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            title: Text(item.text, textAlign: TextAlign.right),
                            trailing: Text('${item.count}/${item.limit}'),
                            onTap: () =>
                                context.read<TasbihCubit>().selectItem(index),
                            tileColor: state.selectedIndex == index
                                ? Colors.brown[100]
                                : null,
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    state.items[state.selectedIndex].text,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown[200]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      state.items[state.selectedIndex].count
                          .toString()
                          .padLeft(2, '0'),
                      style: const TextStyle(
                          fontFamily: 'Digital',
                          fontSize: 48,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.refresh, size: 32),
                        onPressed: () =>
                            context.read<TasbihCubit>().resetCount(),
                      ),
                      const SizedBox(height: 20),
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
