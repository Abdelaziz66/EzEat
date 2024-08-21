import 'package:flutter/material.dart';

import 'address_card.dart';

class AddressGridView extends StatelessWidget {
  const AddressGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(

        itemBuilder: (context, index) => const AddressCard(),
        itemCount:5,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 430,
          mainAxisExtent: 220,
        ),
      ),
    );
  }
}
