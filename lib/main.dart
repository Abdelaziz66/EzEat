import 'package:ez_eat/run_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/functions/hive_setup.dart';
import 'core/functions/setup_service_locator.dart';
import 'core/functions/system_ui_overlay_style.dart';
import 'core/utils/api_keys.dart';
import 'core/utils/simple_bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemStatesNavigationBar();
  setupServiceLocator();
  await hiveSetup();
  Stripe.publishableKey = ApiKeys.publishKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}

