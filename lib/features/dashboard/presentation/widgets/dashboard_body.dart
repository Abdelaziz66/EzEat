import 'package:ez_eat/features/dashboard/presentation/widgets/sandwiches.dart';
import 'package:ez_eat/features/dashboard/presentation/widgets/sweets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/utils/strings.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'banner_slider_item.dart';
import 'best_seller_item.dart';
import 'custom_tab_bar.dart';
import '../../../../core/widgets/custom_title.dart';
import 'discount.dart';
import 'drinks.dart';
class DashboardBody extends StatefulWidget  {
  const DashboardBody({super.key});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);

        if (state is GetDashBoardDataSuccessState) {
          _saveDataFromState(context, state);
          cubit.getFavourite(foods: state.food);
          cubit.getCart(foods: state.food);
        }
        if (state is GetDashBoardDataErrorState) {
          showSnackBar(message: state.errMessage, context: context);
        }
      },
      builder: (context, state) {
        DashboardCubit.get(context);
        return NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Titles(
                    title: Strings.dashboardTitle,
                    subtitle: Strings.dashboardSubTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTabBar(tabController: tabController,),
                ],
              ),
            ),
          ],
          body:_CustomTabView(tabController: tabController),
        );
      },
    );
  }

  void _saveDataFromState(
      BuildContext context, GetDashBoardDataSuccessState state) {
    DashboardCubit cubit = DashboardCubit.get(context);

    _saveBestSellerCarousel(cubit, state);
    _saveOffersCarousel(cubit, state);
    _saveFoodCategory(cubit, state);
  }

  void _saveFoodCategory(
      DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.foods = [];
    cubit.foods.addAll(state.food);
  }

  void _saveOffersCarousel(
      DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.offersCarouselList = [];
    for (int i = 0; i < 4; i++) {
      cubit.offersCarouselList.add(
        BannerItem(food: state.food[i]),
      );
    }
  }

  void _saveBestSellerCarousel(
      DashboardCubit cubit, GetDashBoardDataSuccessState state) {
    cubit.bestSellerCarouselList = [];
    for (int i = 4; i < 8; i++) {
      cubit.bestSellerCarouselList.add(
        BestSellerItem(food: state.food[i]),
      );
    }
  }
}

class _CustomTabView extends StatelessWidget {
  const _CustomTabView({
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller:tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
      Discount(),
      Sandwiches(),
      Sweets(),
      Drinks(),
    ],
    );
  }
}
