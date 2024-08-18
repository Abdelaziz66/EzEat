
import 'package:flutter/material.dart';

import '../widgets/login_or_register_body.dart';

class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: const LoginOrRegisterBody(),
    );
  }
}
