import 'dart:ui';

import 'package:ez_eat/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/blur_layer.dart';
import 'layout_appBar.dart';
import 'layout_background.dart';
import 'layout_bottomNavigationBar.dart';

class Layoutbody extends StatelessWidget {
  const Layoutbody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          LayoutCubit cubit=LayoutCubit.get(context);
          return Stack(
            children: [
              const LayoutBackground(),
              const BlurLayer(),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: cubit.navigationBarScreens[
                cubit.currentNavigationBarIndex],
              ),
              const Column(
                children: [
                  LayoutAppBar(),
                  Spacer(),
                  LayoutNavigationBar(),
                ],
              ),

            ],
          );
        },
      ),
    );
  }
}

