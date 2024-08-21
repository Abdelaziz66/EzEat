import 'package:ez_eat/core/widgets/custom_text_form_field.dart';
import 'package:ez_eat/core/widgets/glass_box.dart';
import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../manager/address_cubit.dart';

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: SizedBox(),),
                        const Expanded(
                          child: Text(
                            'Address Card',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: IconButton(
                                onPressed: (){
                                  GoRouter.of(context).pop();
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.circleDown,
                                  size: 30,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomTextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        hintText: 'name',
                        prefixIcon: FontAwesomeIcons.solidUser,
                        obscureText: false,
                        suffix: const SizedBox(),
                        borderRadius: 20,
                      ),
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
                        prefixIcon: FontAwesomeIcons.locationDot,
                        obscureText: false,
                        suffix: const SizedBox(),
                        borderRadius: 20,
                      ),
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
                        suffix: const SizedBox(),
                        borderRadius: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomButton(
                        onTap: () {
                          if (addressFormKey.currentState!.validate()) {
                            AddressEntity addressEntity = AddressEntity(
                              name: nameController.text,
                              phone: numberController.text,
                              address: addressController.text,
                            );
                            AddressCubit.get(context).uploadAddress(
                              addressEntity: addressEntity,
                            );
                            GoRouter.of(context).pop();
                          }
                        },
                        text: 'Add',
                      ),
                    ),
                    const SizedBox(height: 100,),
                  ],
                ),
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
