import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/setup_service_locator.dart';
import '../../data/data_sources/login_remote_data_source.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/login_body.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        loginUseCase: LoginUseCase(
          loginRepo: getIt.get<LoginRepoImpl>(),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: const LoginBody(),
      ),
    );
  }
}
