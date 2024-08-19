import 'package:hive_flutter/adapters.dart';

import '../../features/dashboard/domain/entities/food_entity.dart';
import '../constants/constant.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FoodEntityAdapter());
  await Hive.openBox<FoodEntity>(kFoodBox);
  await Hive.openBox(kStartBox);
  var startBoxData = Hive.box(kStartBox);
  isOnboarding = startBoxData.get('isOnboarding') ?? false;
  isLogin = startBoxData.get('isLogin') ?? false;
  isSkip=startBoxData.get('skip') ?? false;
  uId = startBoxData.get('uId');
  print(uId);


}