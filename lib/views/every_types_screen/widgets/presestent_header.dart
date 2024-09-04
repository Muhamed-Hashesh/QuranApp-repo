import 'package:flutter/material.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader({required this.widget});
  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Center(child: widget),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
