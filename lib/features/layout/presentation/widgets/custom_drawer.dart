import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/widgets/glass_box.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../../onboarding/presentation/pages/login_or_register.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.black,
      elevation: 0,
      child: GlassBox(
        widget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 80,
                    child: CircleAvatar(
                      radius: 75.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(
                        'assets/images/background/Spline.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'TasteTrek',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 3,
                color: Colors.black.withOpacity(.2),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: true
                          ? Colors.white.withOpacity(1)
                          : Colors.transparent,
                    ),
                    alignment: AlignmentDirectional.topStart,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.house,
                            size: 20,
                            color: true ? Colors.black : Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Dashboard',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: true ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color:cubit.D_value==1? Colors.black.withOpacity(.8):Colors.transparent,
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional.topStart,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.solidUser,
                            size: 20,
                            // color:cubit.D_value==2? Colors.white:Colors.white,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                // color:cubit.D_value==2? Colors.white:Colors.white,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color:cubit.D_value==1? Colors.black.withOpacity(.8):Colors.transparent,
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional.topStart,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.chartSimple,
                            size: 20,
                            // color:cubit.D_value==2? Colors.white:Colors.white,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Grades',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                // color:cubit.D_value==2? Colors.white:Colors.white,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color:cubit.D_value==1? Colors.black.withOpacity(.8):Colors.transparent,
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional.topStart,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.gear,
                            size: 20,
                            // color:cubit.D_value==2? Colors.white:Colors.white,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                // color:cubit.D_value==2? Colors.white:Colors.white,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    isLogin=false;
                    uId=null;
                    saveToHive('isLogin',false, kStartBox);
                    saveToHive('uId',null, kStartBox);
                    ChangeFavouriteSuccessState.favourite=[];
                    ChangeCartSuccessState.cart=[];
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>const LoginOrRegister(),
                    ),);

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color:cubit.D_value==1? Colors.black.withOpacity(.8):Colors.transparent,
                      color: Colors.transparent,
                    ),
                    alignment: AlignmentDirectional.topStart,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.rightFromBracket,
                            size: 20,
                            // color:cubit.D_value==2? Colors.white:Colors.white,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                // color:cubit.D_value==2? Colors.white:Colors.white,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        color: Colors.black.withOpacity(1),
        borderRadius: 20,
        x: 50,
        y: 50,
        border: false,
      ),
    );
  }
}
