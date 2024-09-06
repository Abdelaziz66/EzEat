import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: CarouselSlider(
        items: DashboardCubit.get(context).offersCarouselList,
        options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
