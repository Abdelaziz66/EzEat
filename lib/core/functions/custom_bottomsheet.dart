import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/payment/data/repositories/payment_repo_impl.dart';
import '../../features/payment/domain/use_cases/payment_usecase.dart';
import '../../features/payment/presentation/manager/payment_cubit.dart';
import '../widgets/glass_box.dart';

void customBottomSheet({required context, required Widget widget}) =>
    showModalBottomSheet(

        context: context,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        barrierColor: Colors.transparent,

        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GlassBox(
              widget: widget,
              color: Colors.white.withOpacity(.3),
              border: true,
              borderRadius: 28,
              x: 20,
              y: 20,
            ),
          );
        });


void paymentBottomSheet(
    {required context, required Widget widget,}) =>
    showModalBottomSheet(

        context: context,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        barrierColor: Colors.transparent,

        builder: (context) {
          return BlocProvider(
              create: (context) =>
                  PaymentCubit(
                      paymentUseCase:
                      PaymentUseCase(paymentRepo: PaymentRepoImpl()),),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlassBox(
                widget: widget,
                color: Colors.white.withOpacity(.3),
                border: true,
                borderRadius: 28,
                x: 20,
                y: 20,
              ),
            ),
          );
        });
