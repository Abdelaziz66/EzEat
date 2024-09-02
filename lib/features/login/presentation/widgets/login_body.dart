import 'package:ez_eat/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:ez_eat/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:ez_eat/features/dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../../../core/functions/custom_snack_bar_message.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/animation_background.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_cubit.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../data/models/login_model.dart';
import '../manager/login_cubit/login_cubit.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _loginSuccess(state, context);
        }
        if (state is LoginErrorState) {
          showSnackBar(message: 'Login Failed', context: context);
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return AnimationBackground(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    children: [
                      const BackIcon(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      const Text(
                        'Hello Again !',
                        style: Styles.textStyle35,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Welcome back you have been missed!',
                        textAlign: TextAlign.center,
                        style: Styles.textStyle30.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(                        borderRadius: 20,

                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                        prefixIcon: FontAwesomeIcons.solidEnvelope,
                        obscureText: false,
                        suffix: const SizedBox(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(                        borderRadius: 20,

                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        prefixIcon: FontAwesomeIcons.lock,
                        obscureText: cubit.isVisible,
                        suffix: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 20),
                          child: GestureDetector(
                            onTap: () {
                              cubit.changeEye();
                            },
                            child: FaIcon(
                              cubit.isVisible
                                  ? FontAwesomeIcons.eyeSlash
                                  : FontAwesomeIcons.eye,
                              color: KColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      state is LoginLoadingState
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              onTap: () {
                                _clickOnLogin(cubit);
                              },
                              text: 'Login',
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      const _GoToRegister(),
                      // SizedBox(height: MediaQuery.of(context).size.height*.2,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _clickOnLogin(LoginCubit cubit) {
    // if (loginFormKey.currentState!.validate()) {
      LoginDataModel loginDataModel = LoginDataModel(
        // email: emailController.text,
        // password: passwordController.text,
        email: '3bdel3zizelsayed123@gmail.com',
        password: '123456',
      );
      cubit.login(
        loginDataModel: loginDataModel,
      );
    // }
  }

  void _loginSuccess(LoginSuccessState state,context) async {
    showSnackBar(message: 'Login Successful', context: context);
    save('isLogin', true, kStartBox);
    save('uId', LoginSuccessState.loginEntity?.uid, kStartBox);
    save('isSkip', false, kStartBox);
    save('id', LoginSuccessState.loginEntity?.id, kStartBox);
    isSkip=false;
    isLogin=true;
    loginEntity=LoginSuccessState.loginEntity;
    uId = LoginSuccessState.loginEntity?.uid;
    customerId=LoginSuccessState.loginEntity?.id;
    isMainGetFood=false;
    await uploadLocalFavouriteCart(context);
    GoRouter.of(context).go(AppRouter.kLayout);
    DashboardCubit.get(context).getFood();
  }
  Future<void> uploadLocalFavouriteCart(context) async {
    if( ChangeCartSuccessState.cart.isNotEmpty||ChangeFavouriteSuccessState.favourite.isNotEmpty){
      showSnackBar(message: 'Connecting your last activity', context: context);
      for (int i = 0; i < ChangeCartSuccessState.cart.length; i++){
        await  CartCubit.get(context)
            .addToCartCloud(food: ChangeCartSuccessState.cart[i]);
      }
      for (int i = 0; i < ChangeFavouriteSuccessState.favourite.length; i++) {
        await FavouriteCubit.get(context).addToFavouriteCloud(
          food: ChangeFavouriteSuccessState.favourite[i],);
      }
    }
    DashboardCubit.get(context).foods = [];
    ChangeCartSuccessState.cart=[];
    ChangeFavouriteSuccessState.favourite=[];
  }
}

class _GoToRegister extends StatelessWidget {
  const _GoToRegister();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not a member !',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegister);
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
