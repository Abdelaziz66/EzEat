import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_sources/register_remote_data_source.dart';
import '../../data/repositories/register_repo_impl.dart';
import '../../domain/use_cases/register_usecase.dart';
import '../manager/register_cubit/register_cubit.dart';
import '../widgets/register_body.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          registerUseCase: RegisterUseCase(
              registerRepo: RegisterRepoImpl(
                  registerRemoteDataSource: RegisterRemoteDataSourceImpl()))),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: const RegisterBody(),
      ),
    );
  }
}
