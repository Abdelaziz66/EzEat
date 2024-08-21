import 'package:ez_eat/core/functions/setup_service_locator.dart';
import 'package:ez_eat/features/profile/data/repositories/address_repo_impl.dart';
import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';
import 'package:ez_eat/features/profile/domain/use_cases/get_address_usecase.dart';
import 'package:ez_eat/features/profile/presentation/widgets/user_info.dart';
import 'package:ez_eat/features/profile/presentation/widgets/verify_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/save_food.dart';
import '../../../../core/utils/app_router.dart';
import '../../../cart/presentation/manager/cart_cubit/cart_state.dart';
import '../../../dashboard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import '../../../favourite/presentation/manager/favourite_cubit/favourite_state.dart';
import '../../../login/presentation/manager/login_cubit/login_cubit.dart';
import '../../domain/use_cases/upload_address_usecase.dart';
import '../manager/address_cubit.dart';
import 'address_gridview.dart';
import 'custom_bottom_sheet.dart';
import 'custom_profile_button.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  var isFloatingActionButton = false;
  var profileScaffoldKey = GlobalKey<ScaffoldState>();

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
          AddressCubit cubit =AddressCubit.get(context);
          if(state is UploadAddressSuccessState){
            cubit.getAddress();
          }
         },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            key: profileScaffoldKey,
            body: Column(
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
                          logout(context);
                        },
                      ),
                    ],
                  ),
                ),
                const VerifyAccount(),
                const AddressGridView(),
              ],
            ),
          );
        },
      ),
    );
  }

  void showCustomBottomSheet(context) {
    if (isFloatingActionButton) {
      Navigator.pop(context);
      isFloatingActionButton = false;
    } else {
      profileScaffoldKey.currentState!.showBottomSheet(
          backgroundColor: Colors.transparent,
          elevation: 0,
          enableDrag: false,
          (context) => const CustomBottomSheet());
      isFloatingActionButton = true;
    }
  }

  void logout(context) {
    isLogin = false;
    uId = null;
    save('isLogin', false, kStartBox);
    save('uId', null, kStartBox);
    ChangeFavouriteSuccessState.favourite = [];
    ChangeCartSuccessState.cart = [];
    DashboardCubit.get(context).foods = [];
    LoginSuccessState.loginEntity = null;
    GoRouter.of(context).go(AppRouter.kLoginOrRegister);
  }
}
