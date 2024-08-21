import 'package:ez_eat/core/widgets/custom_text_form_field.dart';
import 'package:ez_eat/core/widgets/glass_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_button.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  var addressFormKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var addressController = TextEditingController();

  var numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12.0),
        child: GlassBox(
          widget: SizedBox(
            // width: double.infinity,
            height: 485,

            child: Form(
              key: addressFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 35,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomTextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        hintText: 'name',
                        prefixIcon: FontAwesomeIcons.user,
                        obscureText: false,
                        suffix: const SizedBox(), borderRadius: 20,),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomTextFormField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        hintText: 'address',
                        prefixIcon: FontAwesomeIcons.location,
                        obscureText: false,
                        suffix: const SizedBox(), borderRadius: 20,),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomTextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.name,
                        hintText: 'number',
                        prefixIcon: FontAwesomeIcons.phone,
                        obscureText: false,
                        suffix: const SizedBox(), borderRadius: 20,),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: CustomButton(onTap: (){
                      // if (formkey.currentState!
                      //     .validate()) {
                      //   print(NameController.text);
                      //   print(AdressController.text);
                      //   print(NumberController.text);
                      //   cubit.InsertToDataBase(
                      //       NameController.text,
                      //       AdressController.text,
                      //       NumberController.text,
                      //       1,1,1,1,
                      //       cubit.table1);
                      //   print("Insert Ended");
                      //   cubit.GetFromDataBase(
                      //       cubit.database, cubit.table1);
                      // }
                    },text: 'Confirm',),
                  ),

                ],
              ),
            ),
          ),
          color: Colors.white.withOpacity(.3),
          border: true,
          borderRadius: 28,
          x: 20,
          y: 20,
        ));
  }
}