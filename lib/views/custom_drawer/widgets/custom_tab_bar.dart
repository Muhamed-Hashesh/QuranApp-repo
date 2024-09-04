import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0,
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        unselectedLabelColor:
            Theme.of(context).colorScheme.onSecondaryContainer,
        labelPadding: const EdgeInsets.all(0),
        tabs: [
          Tab(
            child: Text(
              'الإعدادات',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
          Tab(
            child: Text(
              'المفضلة',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
