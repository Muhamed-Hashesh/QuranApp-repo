import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

AppBar InPagesAppBar(BuildContext context,
    {required GlobalKey<ScaffoldState> scaffoldKey,
    required String title,
    bool searchBar = false}) {
  return AppBar(
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    ),
    leading: IconButton(
      onPressed: () => scaffoldKey.currentState?.openDrawer(),
      icon: Icon(
        Iconsax.menu,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    actions: [
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        onPressed: () {},
        icon: searchBar
            ? const Icon(Iconsax.search_normal_1)
            : const Icon(Iconsax.arrow_left2),
      ),
    ],
  );
}
