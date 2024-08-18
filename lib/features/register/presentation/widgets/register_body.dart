import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/show_flutter_toast_message.dart';
import '../../../../core/style/colors.dart';
import '../../../../core/style/textStyles.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/animation_background.dart';
import '../../../../core/widgets/back_icon.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../data/models/register_model.dart';
import '../manager/register_cubit/register_cubit.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          showFlutterToastMessage(message: 'Register Successful');
        }
        if (state is RegisterErrorState) {
          showFlutterToastMessage(message: 'Register Failed');
        }
      },
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return AnimationBackground(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const BackIcon(),
                        SizedBox(height: MediaQuery.of(context).size.height*.05,),
                        const Text(
                          'Register',
                          style: Styles.textStyle35,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Welcome to Food app!',
                          style: Styles.textStyle30
                              .copyWith(color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          hintText: 'User name',
                          prefixIcon: FontAwesomeIcons.solidUser,
                          obscureText: false,
                          suffix: const SizedBox(),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone number',
                          prefixIcon: FontAwesomeIcons.phone,
                          obscureText: false,
                          suffix: const SizedBox(),
                        ),
                        const SizedBox(
                          height: 12,
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
                        state is RegisterLoadingState?
                        const CircularProgressIndicator():
                        CustomButton(
                          onTap: () {
                            _clickOnRegister(cubit);
                          },
                          text: 'Register',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const _HaveAccount(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _clickOnRegister(RegisterCubit cubit) {
       if (formKey.currentState!.validate()) {
      RegisterModel registerModel = RegisterModel(
         email:  emailController.text,
         password: passwordController.text,
        name: nameController.text,
         phone: phoneController.text);
      cubit.register(
        registerModel: registerModel,
      );
    }
  }
}

class _HaveAccount extends StatelessWidget {
  const _HaveAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account !',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLogin);
          },
          child: const Text(
            'Login now',
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
