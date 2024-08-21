import 'package:flutter/material.dart';

import '../../../../core/style/textStyles.dart';
import '../../../login/presentation/manager/login_cubit/login_cubit.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 15,),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                decoration:
                 const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.white12,
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ]),
                child:  const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white10,
                  backgroundImage:
                  NetworkImage('https://www.kaericature.com/wp-content/uploads/2023/05/custom_avatar_3d-800x800.jpg',),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0.0',
                            style: Styles.textStyle18Bold

                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Balance',
                            style: Styles.textStyle16

                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                            style: Styles.textStyle18Bold
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Points',
                            style: Styles.textStyle16
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '1',
                            style: Styles.textStyle18Bold
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Level',
                            style: Styles.textStyle16
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          const Name(),
        ],
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                LoginSuccessState.loginEntity==null?'Guest':    LoginSuccessState.loginEntity!.name!,
              style: Styles.textStyle16black

            ),
            const SizedBox(
              height: 2,
            ),
            Text(

                LoginSuccessState.loginEntity==null?'':    LoginSuccessState.loginEntity!.email!,
                style: Styles.textStyle16black

            ),
          ],
        ),
      ),
    );
  }
}
