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
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CustomCheckIcon(),
            SizedBox(
              height: 12,
            ),
            Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.textStyle25,
            ),
            Text(
              'Transaction Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black54
              ),
            ),
            SizedBox(
              height: 25,
            ),
            _PaymentInfo(),
            Divider(
              height: 60,
              thickness: 1,
            ),
            TotalPrice(title: 'Total', value: '\$25.00'),
            SizedBox(
              height: 25,
            ),
            CardInfoWidget(),
            SizedBox(
              height: 25,
            ),
            CustomDashedLine(),
            SizedBox(
              height: 25,
            ),
            _PaymentTeal(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}





class _PaymentTeal extends StatelessWidget {
  const _PaymentTeal();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 58,
            decoration: ShapeDecoration(
              color: Colors.white24,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Colors.white30),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Center(
              child: Icon(
                FontAwesomeIcons.barcode,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              height: 58,
              decoration: ShapeDecoration(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'PAID',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle25
                      .copyWith(color: Colors.white70),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _PaymentInfo extends StatelessWidget {
  const _PaymentInfo();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          PaymentItemInfo(
            title: 'Data',
            value:
                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
            value: 'EzEat',
          ),
        ],
      ),
    );
  }
}
