import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../views.dart/tabs/components.dart/page_indicator.dart';

class SliderBuilder<T> extends StatefulWidget {
  const SliderBuilder({
    super.key,
    this.controller,
    this.initialIndex = 0,
    this.sliders = const [],
    this.aspectRatio = 2 / 1,
    this.indicatorColor,
    this.indicatorSize = 8,
    this.indicatorSpace = 6,
    this.loader,
    required this.itemBuilder,
  });

  final CarouselSliderController? controller;
  final int initialIndex;
  final List<T> sliders;
  final double aspectRatio;
  final Color? indicatorColor;
  final double indicatorSize;
  final double indicatorSpace;
  final Widget? loader;
  final Widget Function(T) itemBuilder;

  @override
  State<SliderBuilder<T>> createState() => _SliderBuilderState<T>();
}

class _SliderBuilderState<T> extends State<SliderBuilder<T>> {
  late PageController pageController;
  late CarouselSliderController controller;
  late int pageIndex;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.initialIndex);
    controller = widget.controller ?? CarouselSliderController();
    pageIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.sliders.isEmpty
      ? const SizedBox.shrink()
      : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: widget.sliders.length,
              options: CarouselOptions(
                aspectRatio: widget.aspectRatio,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  pageController = PageController(initialPage: index);
                  setState(() => pageIndex = index);
                },
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  widget.itemBuilder(widget.sliders[index]),
            ),
            const SizedBox(height: 16),
            PageIndicator(
              count: widget.sliders.length,
              controller: pageController,
            ),
          ],
        );
}
