import 'package:ez_eat/features/payment/data/repositories/payment_repo_impl.dart';
import 'package:ez_eat/features/payment/domain/use_cases/payment_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/payment_cubit.dart';
import '../widgets/payment_body.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentBody();
  }
}
