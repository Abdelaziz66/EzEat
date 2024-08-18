import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/animation_background.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
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
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          _loginSuccess(state, context);
        }
        if (state is LoginErrorState) {
          showFlutterToastMessage(message: 'Login Failed');
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
                  key: formKey,
                  child: Column(
              
                    children: [
                      const BackIcon(),
                      SizedBox(height: MediaQuery.of(context).size.height*.1,),
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
                        style: Styles.textStyle30
                            .copyWith(color: Colors.black54,),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFormField(
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
                      CustomTextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: 'Password',
                        prefixIcon: FontAwesomeIcons.lock,
                        obscureText: cubit.isVisible,
                        suffix: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 20),
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
                     state is LoginLoadingState?
                     const CircularProgressIndicator():
                      CustomButton(
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
    if (formKey.currentState!.validate()) {
      LoginDataModel loginDataModel = LoginDataModel(
         email:  emailController.text,
         password: passwordController.text,);
      cubit.login(
          loginDataModel:loginDataModel,
      );
    }
  }

  void _loginSuccess(LoginSuccessState state, BuildContext context) {
     showFlutterToastMessage(message: 'Login Successful');
    saveToHive('isLogin',true, kStartBox);
    saveToHive('uId',state.loginEntity.uid, kStartBox);
    uId=state.loginEntity.uid;
    GoRouter.of(context).push(AppRouter.kLayout);
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


