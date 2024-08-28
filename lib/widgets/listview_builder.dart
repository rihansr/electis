import 'package:flutter/material.dart';

class ListViewBuilder<T> extends StatelessWidget {
  final ScrollController? controller;
  final bool reverse;
  final bool shrinkWrap;
  final List<T> items;
  final Function(T item, int index) builder;
  final double itemSpacing;
  final ScrollPhysics scrollPhysics;
  final Axis scrollDirection;
  final Widget? divider;
  final EdgeInsets? spacing;
  final Function(T)? onItemSelected;

  const ListViewBuilder({
    super.key,
    this.controller,
    this.reverse = false,
    this.shrinkWrap = false,
    required this.items,
    required this.builder,
    this.itemSpacing = 0,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.divider,
    this.spacing,
    this.onItemSelected,
  });

  const ListViewBuilder.vertical({
    super.key,
    this.controller,
    this.reverse = false,
    this.shrinkWrap = false,
    required this.items,
    required this.builder,
    this.itemSpacing = 0,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.divider,
    this.spacing,
    this.onItemSelected,
  }) : scrollDirection = Axis.vertical;

  const ListViewBuilder.horizontal({
    super.key,
    this.controller,
    this.reverse = false,
    this.shrinkWrap = false,
    required this.items,
    required this.builder,
    this.itemSpacing = 0,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.divider,
    this.spacing,
    this.onItemSelected,
  }) : scrollDirection = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      scrollDirection: scrollDirection,
      physics: scrollPhysics,
      reverse: reverse,
      padding: spacing,
      shrinkWrap: shrinkWrap,
      itemCount: items.length,
      itemBuilder: (_, i) => onItemSelected != null
          ? InkWell(
              key: ValueKey('${i}_key'),
              onTap: () => onItemSelected?.call(items[i]),
              child: builder(items[i], i),
            )
          : builder(items[i], i),
      separatorBuilder: (context, index) {
        return SizedBox(
          width: scrollDirection == Axis.horizontal ? itemSpacing : null,
          height: scrollDirection == Axis.vertical ? itemSpacing : null,
          child: divider,
        );
      },
    );
  }
}
