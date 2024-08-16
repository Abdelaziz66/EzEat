import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../style/colors.dart';
import '../style/textStyles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
    required this.suffix,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget suffix;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(.1),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return '$hintText is Required';
          }
          return null;
        },
        textAlignVertical: TextAlignVertical.center,
        cursorColor: KColors.primaryColor,

        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  prefixIcon,
                  color: KColors.primaryColor,
                  // size: 30,
                ),
              ],
            ),
          ),
          suffix: suffix,
          hintText: hintText,
          hintStyle: Styles.textStyle20,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          errorStyle: Styles.textStyle12.copyWith(color: Colors.black45),
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          // error: Padding(
          //   padding: const EdgeInsets.only(left: 55.0),
          //   child: Text('Required'),
          // ),
          filled: false,


        ),
      ),
    );
  }
}