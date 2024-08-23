import 'package:hive_flutter/adapters.dart';

import '../../features/dashboard/domain/entities/food_entity.dart';
import '../../features/login/domain/entities/login_entity.dart';
import '../../features/profile/domain/entities/address_entity.dart';
import '../constants/constant.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoodEntityAdapter());
  Hive.registerAdapter(LoginEntityAdapter());
  Hive.registerAdapter(AddressEntityAdapter());

  await Hive.openBox<FoodEntity>(kFoodBox);
  await Hive.openBox(kStartBox);
  await Hive.openBox<LoginEntity>(kUserBox);
  await Hive.openBox<AddressEntity>(kAddressBox);

  var startBoxData = Hive.box(kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;
  isLogin = startBoxData.get('isLogin') ?? false;
  isSkip=startBoxData.get('isSkip') ?? false;
  uId = startBoxData.get('uId');

  var box = Hive.box<LoginEntity>(kUserBox);
  loginEntity=box.get('loginEntity');



}