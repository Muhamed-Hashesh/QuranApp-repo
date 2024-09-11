import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.searchBar = false,
    this.centerTitle = true,
    this.notTitle = false,
    this.widget,
  });

  final String? title;
  final bool searchBar;
  final bool centerTitle;
  final bool notTitle;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      centerTitle: centerTitle,
      title: notTitle
          ? widget // Use the provided widget directly
          : widget ??
              Text(
                title ?? '', // Provide a default value if title is null
                style: Theme.of(context).textTheme.titleMedium,
              ),
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Iconsax.menu,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          onPressed: () {
            if (searchBar) {
              print('search bar');
              // Handle search bar functionality
            } else {
              Navigator.pop(context);
            }
          },
          icon: searchBar
              ? const Icon(Iconsax.search_normal_1)
              : const Icon(IconsaxPlusLinear.arrow_left_1),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
