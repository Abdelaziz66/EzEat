import 'package:flutter/material.dart';
import '../../features/login/domain/entities/login_entity.dart';

const kTransitionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kFoodBox = 'food_box';
const kStartBox = 'start_box';
const kUserBox = 'user_box';
const kAddressBox = 'address_box';


late LoginEntity? loginEntity;
  bool? isOnboarding;
  bool? isLogin;
  bool? isSkip;
  String? uId ;
  bool isMainGetFood=true;
  String? customerId ;

var layoutScaffoldKey=GlobalKey<ScaffoldState>();
var profileScaffoldKey = GlobalKey<ScaffoldState>();
