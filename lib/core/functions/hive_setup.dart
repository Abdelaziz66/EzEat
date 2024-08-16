import 'package:hive_flutter/adapters.dart';

import '../../features/dashboard/domain/entities/food_entity.dart';
import '../constants/constant.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoodEntityAdapter());
  await Hive.openBox<FoodEntity>(kFoodBox);
  await Hive.openBox(KStartBox);
  var startBoxData = Hive.box(KStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;
  isLogin = startBoxData.get('isLogin') ?? false;
  uId = startBoxData.get('uId');
  print(isOnboarding);
  print(isLogin);
  print(uId);

}