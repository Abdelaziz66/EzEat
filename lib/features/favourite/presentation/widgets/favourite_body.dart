import 'package:flutter/material.dart';

import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/custom_title.dart';
import 'favourite_listview.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Titles(title: Strings.dashboardTitle, subtitle: Strings.dashboardSubTitle,),
        FavouriteListView(),


      ],

    );
  }
}