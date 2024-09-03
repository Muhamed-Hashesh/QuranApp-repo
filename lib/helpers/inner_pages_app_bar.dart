import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

AppBar InPagesAppBar(
  BuildContext context, {
  required GlobalKey<ScaffoldState> scaffoldKey,
  required String title,
  bool searchBar = false,
  bool centerTitle = true,
}) {
  return AppBar(
    centerTitle: centerTitle,
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
            : const Icon(IconsaxPlusLinear.arrow_left_1),
      ),
    ],
  );
}
