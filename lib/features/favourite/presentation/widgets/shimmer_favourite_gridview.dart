import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widgets/shimmer_text.dart';

class LoadingFavouriteGridView extends StatelessWidget {
  const LoadingFavouriteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey.shade300,
        enabled: true,
        child: SizedBox(
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
              // _FavouriteImage(),
            ],
          ),
        ),
    );
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
      child: Padding(
        padding: const EdgeInsets.only(
            right: 10, left: 25, top: 10.0, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            const ShimmerText(height: 25,paddingRight: 0,),
            const SizedBox(
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

// class _FavouriteImage extends StatelessWidget {
//   const _FavouriteImage({
//     required this.widget,
//   });
//
//   final FavouriteItem widget;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//
//
//       children: [
//         Image.network(
//           '${widget.food.imageUrl}'
//           ,errorBuilder: (context, error, stackTrace) => const ImageError(),
//           height: 190,
//         ),
//       ],
//     );
//   }
// }
