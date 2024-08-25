import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingAddressGridView extends StatefulWidget {
  const LoadingAddressGridView({super.key});

  @override
  State<LoadingAddressGridView> createState() => _LoadingAddressGridViewState();
}

class _LoadingAddressGridViewState extends State<LoadingAddressGridView> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey.shade300,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
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
                    // Container(
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withOpacity(.5),
                    //         spreadRadius: 3,
                    //         blurRadius: 25,
                    //         offset: const Offset(0, 15),
                    //
                    //         // changes position of shadow
                    //       ),
                    //     ],
                    //   ),
                    //   child: const CircleAvatar(
                    //     radius: 70,
                    //     backgroundImage: AssetImage('assets/images/onboarding/sheif.png'),
                    //   ),
                    // ),
                    AddressText(),
                    AddressAction(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class AddressAction extends StatelessWidget {
  const AddressAction({
    super.key,
  });

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

class AddressText extends StatelessWidget {
  const AddressText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 100),
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 50),
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 0),
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
