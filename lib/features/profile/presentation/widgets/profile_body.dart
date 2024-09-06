import 'package:ez_eat/core/functions/setup_service_locator.dart';
import 'package:ez_eat/features/profile/data/repositories/address_repo_impl.dart';
import 'package:ez_eat/features/profile/domain/use_cases/get_address_usecase.dart';
import 'package:ez_eat/features/profile/presentation/widgets/user_info.dart';
import 'package:ez_eat/features/profile/presentation/widgets/verify_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/logout.dart';
import '../../domain/use_cases/upload_address_usecase.dart';
import '../manager/address_cubit.dart';
import 'address_gridview.dart';
import 'custom_bottom_sheet.dart';
import 'custom_profile_button.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(
        getAddressUseCase: GetAddressUseCase(
            addressRepo: getIt.get<AddressRepoImpl>()),
        uploadAddressUseCase: UploadAddressUseCase(
            addressRepo: getIt.get<AddressRepoImpl>()),)..getAddress(),
      child: BlocConsumer<AddressCubit, AddressState>(
        listener: (context, state) {
          if(state is UploadAddressSuccessState){
            AddressCubit.get(context).getAddress();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            key: profileScaffoldKey,
            body: NestedScrollView(
              physics: const BouncingScrollPhysics(),


              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>[
                SliverToBoxAdapter(

                  child:Column(
                    children: [
                      const UserInfo(),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            CustomProfileButton(
                              text: 'Add Address',
                              function: () {
                                showCustomBottomSheet(context);
                              },
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            CustomProfileButton(
                              text: 'Logout',
                              function: () {
                                clickOnLogout(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const VerifyAccount(),
                    ],
                  ),
                ),
              ], body:  const AddressGridView(),
            ),
          );
        },
      ),
    );
  }

  void showCustomBottomSheet(context) {
    profileScaffoldKey.currentState!.showBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 0,
        enableDrag: true,
            (context) => const CustomBottomSheet());
  }

  void clickOnLogout(context) {
    logout(context);
  }
}


