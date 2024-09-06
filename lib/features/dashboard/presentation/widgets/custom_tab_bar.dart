import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_tabs.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        return SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: DefaultTabController(
              length: 4,
              initialIndex: cubit.currentTabBarIndex,
              child: TabBar(
                onTap: (index) {
                  cubit.onTapTabBar(index);
                },
                indicatorColor: Colors.white.withOpacity(0),
                padding: EdgeInsets.zero,
                splashBorderRadius: BorderRadius.circular(20),
                splashFactory: NoSplash.splashFactory,
                dividerHeight: 0,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.fill,
                tabs: [
                  CustomTabs(
                    imagePath: 'f1.png',
                    index: cubit.currentTabBarIndex,
                    tabIndex: 0,
                  ),
                  CustomTabs(
                    imagePath: 'f4.png',
                    index: cubit.currentTabBarIndex,
                    tabIndex: 1,
                  ),
                  CustomTabs(
                    imagePath: 'f2.png',
                    index: cubit.currentTabBarIndex,
                    tabIndex: 2,
                  ),
                  CustomTabs(
                    imagePath: 'f3.png',
                    index: cubit.currentTabBarIndex,
                    tabIndex: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
