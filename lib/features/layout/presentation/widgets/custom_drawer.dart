
import 'package:ez_eat/core/style/colors.dart';
import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/core/utils/app_router.dart';
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:ez_eat/features/dashboard/presentation/pages/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../../onboarding/presentation/pages/login_or_register.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int checkIndex=0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: GlassBox(
        widget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const _DrawerImage(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Taste Trek',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle25
                      .copyWith(color: KColors.secondaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Colors.black.withOpacity(.2),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: (){
                        switch (index){
                          case 0:
                            break;
                          case 1:
                            break;
                          case 2:
                            break;
                          case 3:
                            break;
                          case 4:
                            logout(context);
                            break;

                        }




                      },
                      child: DrawerItem(
                        title: drawerTitle[index],
                        index: checkIndex,
                        itemIndex: drawerIndex[index],
                        iconData: drawerIconData[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        color: Colors.black.withOpacity(1),
        borderRadius: 20,
        x: 50,
        y: 50,
        border: false,
      ),
    );
  }

  void logout(BuildContext context) {
    GoRouter.of(context).pop();
    isLogin = false;
    uId = null;
    save('isLogin', false, kStartBox);
    save('uId', null, kStartBox);
    ChangeFavouriteSuccessState.favourite = [];
    ChangeCartSuccessState.cart = [];
    DashboardCubit.get(context).foods=[];
    GoRouter.of(context).go(AppRouter.kLoginOrRegister);

  }
}

class _DrawerImage extends StatelessWidget {
  const _DrawerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 80,
      child: CircleAvatar(
        radius: 75.0,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          'assets/images/background/Spline.png',
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.index,
    required this.iconData,
    required this.itemIndex,
  });
  final String title;
  final int index;
  final int itemIndex;
  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: index == itemIndex
              ? KColors.secondaryColor
              : KColors.primaryColor,
        ),
        alignment: AlignmentDirectional.topStart,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 10),
              FaIcon(
                iconData,
                size: 20,
                color: index == itemIndex ? KColors.primaryColor
                  : KColors.secondaryColor.withOpacity(.8),
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: Styles.textStyle20.copyWith(
                    color: index == itemIndex
                        ? KColors.primaryColor
                        : KColors.secondaryColor.withOpacity(.8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


const List<String> drawerTitle = [
  'Dashboard',
  'Edit Account',
  'History',
  'Setting',
  'Logout',
];
const List<IconData> drawerIconData = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.solidUser,
  FontAwesomeIcons.chartSimple,
  FontAwesomeIcons.gear,
  FontAwesomeIcons.rightFromBracket,
];
const List<int> drawerIndex = [0, 1, 2, 3, 4];