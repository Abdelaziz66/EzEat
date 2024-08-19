import 'package:ez_eat/features/dashboard/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/utils/strings.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'custom_tab_bar.dart';
import '../../../../core/widgets/custom_title.dart';
import 'banner_slider_item.dart';

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
          showFlutterToastMessage(message: state.errMessage);
        }
      },
      builder: (context, state) {
        DashboardCubit  cubit=DashboardCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Titles(title: Strings.dashboardTitle, subtitle: Strings.dashboardSubTitle,),
            const SizedBox(
              height: 10,
            ),
            const CustomTabBar(),
            Expanded(
              child: cubit.tabBarScreens[cubit.currentTabBarIndex],
            ),
          ],
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