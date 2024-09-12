import 'package:animations/animations.dart';
import 'package:ez_eat/features/favourite/presentation/widgets/shimmer_favourite_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/food_details.dart';
import '../../../dashboard/domain/entities/food_entity.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';
import '../manager/favourite_cubit/favourite_state.dart';
import 'favourite_item.dart';

class FavouriteGridView extends StatefulWidget {
  const FavouriteGridView({super.key});


  @override
  State<FavouriteGridView> createState() => _FavouriteGridViewState();
}

class _FavouriteGridViewState extends State<FavouriteGridView> {
  List<FoodEntity> favourite = ChangeFavouriteSuccessState.favourite;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              itemCount: favourite.isNotEmpty ? favourite.length : 7,
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,

              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return OpenContainer(
                  transitionDuration: const Duration(milliseconds: 500),
                  openColor: Colors.white,
                  closedColor: Colors.transparent,
                  closedElevation: 0,
                  openElevation: 0,
                  middleColor: Colors.white,
                  transitionType: ContainerTransitionType.fade,
                  closedBuilder: (BuildContext context,VoidCallback openContainer)=> Center(
                      child: favourite.isNotEmpty
                          ? _favouriteItemBuilder(index, context,openContainer)
                          : const LoadingFavouriteGridView()),
                  openBuilder: (BuildContext context, _) =>FoodDetails(
                    food:favourite[index],
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 340,
                crossAxisCount: MediaQuery.of(context).size.width < 800
                    ? 1
                    : MediaQuery.of(context).size.width >= 800 &&
                            MediaQuery.of(context).size.width < 1200
                        ? 2
                        : MediaQuery.of(context).size.width >= 1200 &&
                                MediaQuery.of(context).size.width < 1600
                            ? 3
                            : 4,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _favouriteItemBuilder(int index, BuildContext context,openContainer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Dismissible(
          key: ValueKey<FoodEntity>(favourite[index]),
          onDismissed: (DismissDirection direction) {
            _swipeItem(context, index);
          },
          direction: DismissDirection.startToEnd,
          background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomLeft,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 65.0, horizontal: 10),
              child: FaIcon(
                FontAwesomeIcons.trash,
                size: 35,
              ),
            ),
          ),
          child: FavouriteItem(
            food: favourite[index], onClick:openContainer ,
          )),
    );
  }

  void _swipeItem(BuildContext context, int index) {
    setState(() {
      FavouriteCubit.get(context)
          .removeFromFavourite(food: favourite[index], context: context);
    });
  }
}
