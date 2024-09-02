import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/utils/strings.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'banner_slider_item.dart';
import 'best_seller_item.dart';
import 'custom_tab_bar.dart';
import '../../../../core/widgets/custom_title.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        DashboardCubit  cubit=DashboardCubit.get(context);

        if (state is GetDashBoardDataSuccessState) {
          saveDataFromState(context, state);
          cubit.getFavourite(foods: state.food);
          cubit.getCart(foods: state.food);
        }
        if (state is GetDashBoardDataErrorState) {
          showSnackBar(message: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        return NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Titles(title: Strings.dashboardTitle,
                    subtitle: Strings.dashboardSubTitle,),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTabBar(),
                ],
              ),
            ),

          ], body:   cubit.tabBarScreens[cubit.currentTabBarIndex],
        );
      },
    );
  }

  void saveDataFromState(BuildContext context, GetDashBoardDataSuccessState state) {
    DashboardCubit  cubit=DashboardCubit.get(context);

    saveBestSellerCarousel(cubit, state);
    saveOffersCarousel(cubit, state);
    saveFoodCategory(cubit, state);

  }

  void saveFoodCategory(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.foods=[];
    cubit.foods.addAll(state.food);
  }

  void saveOffersCarousel(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.offersCarouselList =[];
    for(int i=0;i<4;i++){
      cubit.offersCarouselList.add( BannerItem(food: state.food[i]),);
    }
  }

  void saveBestSellerCarousel(DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.bestSellerCarouselList =[];
    for(int i=4;i<8;i++){
      cubit.bestSellerCarouselList.add( BestSellerItem(food: state.food[i]),);
    }
  }
}
