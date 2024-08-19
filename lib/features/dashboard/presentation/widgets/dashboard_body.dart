import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/strings.dart';
import '../manager/dashboard_cubit/dashboard_cubit.dart';
import 'custom_tab_bar.dart';
import '../../../../core/widgets/custom_title.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        DashboardCubit cubit = DashboardCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Titles(title: Strings.dashboardTitle,
              subtitle: Strings.dashboardSubTitle,),
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
