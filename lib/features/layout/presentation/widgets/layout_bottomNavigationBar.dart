import 'package:ez_eat/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../manager/layout_cubit/layout_cubit.dart';

class LayoutNavigationBar extends StatelessWidget {
  const LayoutNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        LayoutCubit cubit=LayoutCubit.get(context);
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 12.0,
            right: 12,
            left: 12,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 10)
                  // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.white,
                selectedFontSize: 17,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                selectedIconTheme:
                const IconThemeData(color: KColors.secondaryColor, size: 35),
                unselectedIconTheme:
                const IconThemeData(
                    color: Colors.grey, size: 30),
                unselectedLabelStyle: const TextStyle(
                  color: KColors.secondaryColor,
                ),
                unselectedFontSize: 15,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                elevation: 0,
                currentIndex: cubit.currentNavigationBarIndex,

                onTap: (index) {
                  cubit.onTapNavigationBar(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.house),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.heart),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(FontAwesomeIcons.opencart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon:  FaIcon(FontAwesomeIcons.user),
                    label: 'Account',
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