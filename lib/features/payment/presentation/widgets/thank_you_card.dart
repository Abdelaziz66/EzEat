
import 'package:ez_eat/features/payment/presentation/widgets/payment_info_item.dart';
import 'package:ez_eat/features/payment/presentation/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/style/textStyles.dart';
import 'card_info_widget.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(top: 35, left: 15, right: 15),
      child: Column(
        children: [
          const CustomCheckIcon(),
           const SizedBox(height: 15,),
           const Text(
            'Thank you!',
            textAlign: TextAlign.center,
            style: Styles.textStyle25,
          ),
          const Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: Styles.textStyle20,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                PaymentItemInfo(
                  title: 'Data',
                  value: '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentItemInfo(
                  title: 'Time',
                  value: '${DateTime.now().hour}:${DateTime.now().minute}',
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentItemInfo(
                  title: 'To',
                  value: 'Taste Trek',
                ),
              ],
            ),
          ),
          const Divider(
            height: 60,
            thickness: 1,
          ),
          const TotalPrice(title: 'Total', value: '\$50.97'),
          const SizedBox(
            height: 30,
          ),
          const CardInfoWidget(),
          const SizedBox(
            height: 30,
          ),
          const CustomDashedLine(),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 2, color:Color(0xff34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle25
                          .copyWith(color: const Color(0xff34A853)),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
