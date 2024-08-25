import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key, required this.addressEntity,
  });
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white.withOpacity(.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              AddressText(addressEntity: addressEntity),
              const AddressAction(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressAction extends StatelessWidget {
  const AddressAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.radio_button_checked,
                color: Colors.black,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.5),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white.withOpacity(.5),
            child: IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressText extends StatelessWidget {
  const AddressText({
    super.key,
    required this.addressEntity,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              addressEntity.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              addressEntity.phone!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              addressEntity.address!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
