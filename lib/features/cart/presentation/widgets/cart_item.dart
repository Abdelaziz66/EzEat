
import 'package:ez_eat/core/style/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/widgets/food_details.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context,MaterialPageRoute(builder: (context) => FoodDetails(food: food,),));

      },
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white.withOpacity(.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.black.withOpacity(.1),
                    child: Image.asset(
                      'assets/images/food/1.png',
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '14 Pro Max',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle18,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '256 100% with Box 256 100% with Box. 256 100% with Box. Box 256 100% with Box. 256 100% with Box. Box 256 100% with Box. 256 100% with Box..',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle14,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$ 16',
                          style: Styles.textStyle18,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(.1),
                        ),
                        child: IconButton(
                          onPressed: () {

                          },
                          icon:
                          true ? const Icon(
                            Icons.favorite,
                          )
                              : const Icon(
                            Icons.favorite_border,
                          ),
                          // icon: Icon(Icons.favorite_border),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(.1),
                        ),
                        child: IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          // icon: Icon(Icons.favorite_border),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black.withOpacity(.05),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 3),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width*.05,
                          backgroundColor:
                          Colors.pinkAccent.withOpacity(.3),
                          child: IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
                            radius:  MediaQuery.of(context).size.width*.04,
                            backgroundColor:
                            Colors.black.withOpacity(.05),
                            child: const Text(
                              '1',
                              style: Styles.textStyle18,
                            )),
                        const SizedBox(
                          width: 3,
                        ),
                        CircleAvatar(
                          radius:  MediaQuery.of(context).size.width*.05,
                          backgroundColor:
                          Colors.tealAccent.withOpacity(.4),
                          child: IconButton(
                            onPressed: () {

                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                         const Padding(
                           padding: EdgeInsets.symmetric(
                               horizontal: 7.0, vertical: 2),
                           child: Column(
                             children: [
                               Text(
                                 'Total Price',
                                 style: Styles.textStyle12,
                               ),
                               SizedBox(
                                 height: 2,
                               ),
                               Text(
                                 '16 \$',
                                 style: Styles.textStyle14,
                               ),
                             ],
                           ),
                         ),
                        const Spacer(),

                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color:
                              true
                                  ? Colors.teal
                                  : Colors.redAccent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0,right: 5,top: 5,bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  const Text(
                                    '${true ? 'Confirm' : 'Cancel'}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                   SizedBox(width:   MediaQuery.of(context).size.width*.03,),
                                  CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey[300],
                                      child: const Icon(
                                        true
                                            ? Icons.cancel
                                            : Icons.send,
                                        color: true
                                            ? Colors.teal
                                            : Colors.redAccent,
                                        size: 35,
                                      )),

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

