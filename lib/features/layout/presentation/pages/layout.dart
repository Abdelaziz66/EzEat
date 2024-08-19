import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../../onboarding/presentation/pages/login_or_register.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/layout_body.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: layoutScaffoldKey,
      drawer: const CustomDrawer(),
      body: const LayoutBody(),
    );
  }
}

