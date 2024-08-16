import 'package:ez_eat/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/favourite_remote_data_source.dart';
import '../../data/repositories/Favourite_repo_impl.dart';
import '../../domain/use_cases/add_to_favourite_usecase.dart';
import '../../domain/use_cases/remove_from_favourite_usecase.dart';
import '../manager/favourite_cubit/favourite_cubit.dart';
import '../widgets/favourite_body.dart';


class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return const FavouriteBody();

  }
}
