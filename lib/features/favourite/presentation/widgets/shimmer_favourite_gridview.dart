import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_shimmer.dart';
import '../../../../core/widgets/shimmer_text.dart';

class LoadingFavouriteGridView extends StatelessWidget {
  const LoadingFavouriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(widget: SizedBox(
      width: 400,
      child: Stack(
        children: [
          Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(.3),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20.0, right: 20, top: 25,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShimmerText(paddingRight: 100, height: 25,),
                              SizedBox(height: 10,),
                              ShimmerText(paddingRight: 50, height: 20,),
                              SizedBox(height: 5,),

                              ShimmerText(paddingRight: 50, height: 20,),


                            ],
                          ),
                        ),
                      ),
                      // const Spacer(),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20.0, right: 10, bottom: 10),
                        child: Row(
                          children: [
                            ShimmerText(paddingRight: 50, height: 25,),
                            Spacer(),
                            _CustomButton()

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),);
  }
}





class _CustomButton extends StatelessWidget {
  const _CustomButton(
  );



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(35),
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
            right: 10, left: 25, top: 10.0, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 5,
            ),
            ShimmerText(height: 25,paddingRight: 0,),
            SizedBox(
              width: 80,
            ),
            CircleAvatar(
                radius: 17,
                backgroundColor:
                     Colors.black),
          ],
        ),
      ),
    );
  }
}


