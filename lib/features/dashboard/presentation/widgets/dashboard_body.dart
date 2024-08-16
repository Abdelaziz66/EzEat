import 'package:ez_eat/features/dashboard/presentation/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/utils/strings.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'custom_tabbar.dart';
import '../../../../core/widgets/custom_title.dart';
import 'offers_slider_item.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {

        if (state is GetDashBoardDataSuccessState) {
          DashboardCubit.get(context).foods=[];
          DashboardCubit.get(context).bestSellerCarusolList =[];
          DashboardCubit.get(context).bestSellerCarusolList =[
            BestSellerItem(food: state.food[4]),
            BestSellerItem(food: state.food[5]),
            BestSellerItem(food: state.food[6]),
            BestSellerItem(food: state.food[7]),
          ];
          DashboardCubit.get(context).offersCarusolList =[];
          DashboardCubit.get(context).offersCarusolList =[
            OffersItem(food: state.food[0]),
            OffersItem(food: state.food[1]),
            OffersItem(food: state.food[2]),
            OffersItem(food: state.food[3]),
          ];
          DashboardCubit.get(context).foods.addAll(state.food);
          DashboardCubit.get(context).getFavourite(foods: state.food);

        }

        if (state is GetDashBoardDataErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            showFlutterToastMessage(message: state.errMessage),
          );
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
}