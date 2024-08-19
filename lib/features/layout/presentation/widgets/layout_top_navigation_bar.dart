import 'package:ez_eat/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LayoutTopNavigationBar extends StatefulWidget {
  const LayoutTopNavigationBar({
    super.key,
  });

  @override
  State<LayoutTopNavigationBar> createState() => _LayoutTopNavigationBar();
}

class _LayoutTopNavigationBar extends State<LayoutTopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit,LayoutState>(
      builder: (context, state) {
        LayoutCubit  cubit=LayoutCubit.get(context);
        return Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width<700?485:MediaQuery.of(context).size.width<1100&&MediaQuery.of(context).size.width>700? MediaQuery.of(context).size.width*.75: 825,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.white.withOpacity(.2),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DefaultTabController(
                length: 4,
                initialIndex: cubit.currentNavigationBarIndex,
                child: TabBar(
                  onTap: (index) {
                    cubit.onTapNavigationBar(index);
                  },

                  indicatorColor:  Colors.black.withOpacity(0),
                  padding: EdgeInsets.zero,
                  splashBorderRadius: BorderRadius.circular(20),
                  splashFactory: NoSplash.splashFactory,
                  dividerHeight: 0,
                  dividerColor: Colors.black.withOpacity(.1),


                  labelPadding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.fill,
                  tabs:  [
                    CustomTabs(title: 'Home',index:cubit.currentNavigationBarIndex, tabIndex: 0, iconData: FontAwesomeIcons.house, solidIconData: FontAwesomeIcons.house,),
                    CustomTabs(title: 'Favourite',index:cubit.currentNavigationBarIndex, tabIndex: 1, iconData: FontAwesomeIcons.heart, solidIconData: FontAwesomeIcons.solidHeart,),
                    CustomTabs(title: 'Cart',index:cubit.currentNavigationBarIndex, tabIndex: 2, iconData: FontAwesomeIcons.opencart, solidIconData: FontAwesomeIcons.opencart,),
                    CustomTabs(title: 'Account',index:cubit.currentNavigationBarIndex, tabIndex: 3, iconData: FontAwesomeIcons.user, solidIconData: FontAwesomeIcons.solidUser,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

  }
}







class CustomTabs extends StatelessWidget {
  const CustomTabs({
    super.key, required this.title, required this.index, required this.tabIndex, required this.iconData, required this.solidIconData,
  });
  final String title;
  final int index;
  final int tabIndex;
  final IconData iconData;
  final IconData solidIconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(index==tabIndex?solidIconData :iconData,size:index==tabIndex?19: 19,color:index==tabIndex?Colors.black:Colors.black54 ,),
          const SizedBox(width: 10,),
          Text(title,style:  TextStyle(
            color:index==tabIndex? Colors.black: Colors.black54,
            fontWeight: index==tabIndex?FontWeight.w600:FontWeight.w500,
            fontSize: 20,

          ),),
        ],
      ),
    );
  }
}