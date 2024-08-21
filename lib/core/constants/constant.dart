import 'package:flutter/material.dart';


const kTransitionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
const kFoodBox = 'food_box';
const kFavouriteBox = 'favourite_box';
const kStartBox = 'start_box';


  bool? isOnboarding;
  bool? isLogin;
  bool? isSkip;
  String? uId ;
  bool isMainGetFood=true;

var layoutScaffoldKey=GlobalKey<ScaffoldState>();
var profileScaffoldKey = GlobalKey<ScaffoldState>();
