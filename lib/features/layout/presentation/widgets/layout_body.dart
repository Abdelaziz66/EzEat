
import 'package:ez_eat/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/widgets/background_shape.dart';
import '../../../../core/widgets/blur_layer.dart';
import '../../../dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import '../../../dashboard/presentation/widgets/banner_slider_item.dart';
import '../../../dashboard/presentation/widgets/best_seller_item.dart';
import 'layout_app_bar.dart';
import 'layout_bottom_navigation_bar.dart';
import 'layout_top_navigation_bar.dart';

class LayoutBody extends StatelessWidget {
  const LayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return Stack(
            children: [
              const BackGroundShape(),
              const BlurLayer(),
              Screen(cubit: cubit),
              const LayoutAppBar(),
              MediaQuery
                  .of(context)
                  .size
                  .width < 600
                  ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(child: LayoutNavigationBar()),
                ],
              )
                  : const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: LayoutTopNavigationBar()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.cubit,
  });

  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70.0),
      child: cubit.navigationBarScreens[cubit.currentNavigationBarIndex],
    );



  }
  // void saveDataFromState(BuildContext context, GetDashBoardDataSuccessState state) {
  //   DashboardCubit  cubit=DashboardCubit.get(context);
  //
  //   saveBestSellerCarousel(cubit, state);
  //   saveOffersCarousel(cubit, state);
  //   saveFoodCategory(cubit, state);
  //
  // }
  //
  // void saveFoodCategory(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
  //   cubit.foods=[];
  //   cubit.foods.addAll(state.food);
  // }
  //
  // void saveOffersCarousel(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
  //   cubit.offersCarouselList =[];
  //   for(int i=0;i<4;i++){
  //     cubit.offersCarouselList.add( BannerItem(food: state.food[i]),);
  //   }
  // }
  //
  // void saveBestSellerCarousel(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
  //   cubit.bestSellerCarouselList =[];
  //   for(int i=4;i<8;i++){
  //     cubit.bestSellerCarouselList.add( BestSellerItem(food: state.food[i]),);
  //   }
  // }
}

