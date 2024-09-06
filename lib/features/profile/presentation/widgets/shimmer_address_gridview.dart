import 'package:ez_eat/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/shimmer_text.dart';

class LoadingAddressGridView extends StatelessWidget {
  const LoadingAddressGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      widget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white30,
          ),
          child: const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                _AddressText(),
                _AddressAction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressAction extends StatelessWidget {
  const _AddressAction();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white54,
          ),
          CircleAvatar(
            backgroundColor: Colors.white54,
          ),
          CircleAvatar(
            backgroundColor: Colors.white54,
          ),
        ],
      ),
    );
  }
}

class _AddressText extends StatelessWidget {
  const _AddressText();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShimmerText(
              paddingRight: 100,
              height: 25,
            ),
            SizedBox(
              height: 10,
            ),
            ShimmerText(
              paddingRight: 50,
              height: 25,
            ),
            SizedBox(
              height: 10,
            ),
            ShimmerText(
              paddingRight: 0,
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
