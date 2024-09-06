import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';

class LayoutAppBar extends StatelessWidget {
  const LayoutAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DrawerIcon(),
            const Spacer(),
            InkWell(
              onTap: () {
                showSnackBar(message: 'coming soon :)', context: context);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 0.0, right: 20),
                child: FaIcon(FontAwesomeIcons.opencart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => layoutScaffoldKey.currentState?.openDrawer(),
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 20),
        child: SizedBox(
          width: 38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 2.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                width: 20,
                height: 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
