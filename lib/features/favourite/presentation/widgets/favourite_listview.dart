import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../dashboard/domain/entities/food_entity.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';
import '../manager/favourite_cubit/favourite_state.dart';
import 'favourite_item.dart';

class FavouriteListView extends StatefulWidget {
  const FavouriteListView({super.key});

  @override
  State<FavouriteListView> createState() => _FavouriteListViewState();
}

class _FavouriteListViewState extends State<FavouriteListView> {
   List<FoodEntity>favourite = ChangeFavouriteSuccessState.favourite;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        // if(state is ChangeFavouriteSuccessState){
        //   favourite=ChangeFavouriteSuccessState.favourite;
        //   print('from favourite listener');
        // }
      },
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: favourite.length,
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FavouriteItem(food: favourite[index],),
              );
            },
          ),
        );
      },
    );
  }
}
