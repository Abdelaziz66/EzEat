import 'package:ez_eat/core/functions/custom_snack_bar_message.dart';
import 'package:ez_eat/core/style/textStyles.dart';
import 'package:ez_eat/features/profile/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.addressEntity,
  });
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 235,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Colors.white.withOpacity(.3),
        ),
        child: Column(
          children: [
            const _AddressAction(),
            Container(
              color: Colors.white24,
              height: 2,
            ),
            Row(
              children: [
                const _CustomImage(),
                _AddressText(addressEntity: addressEntity),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





class _CustomImage extends StatelessWidget {
  const _CustomImage();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10.0, left: 10),
      child: CircleAvatar(
        radius: 75,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/images/location.png'),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
          ),
          Text(
            'Address Card',
            style: Styles.textStyle18,
          ),
          Spacer(),
          _CardIcons(
            iconData: Icons.delete_outline,
          ),
          SizedBox(
            width: 7,
          ),
          _CardIcons(
            iconData: Icons.edit,
          ),
          SizedBox(
            width: 7,
          ),
          _CardIcons(
            iconData: Icons.radio_button_off,
          ),
        ],
      ),
    );
  }
}

class _CardIcons extends StatelessWidget {
  const _CardIcons({
    required this.iconData,
  });
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white38,
      radius: 18,
      child: IconButton(
        onPressed: () {
          showSnackBar(context: context, message: 'Soon :)');
        },
        icon: Icon(
          iconData,
          color: Colors.black87,
          size: 20,
        ),
      ),
    );
  }
}

class _AddressText extends StatelessWidget {
  const _AddressText({
    required this.addressEntity,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(addressEntity.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle20),
            const SizedBox(
              height: 10,
            ),
            Text(addressEntity.phone!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle16),
            const SizedBox(
              height: 10,
            ),
            Text(addressEntity.address!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle16),
          ],
        ),
      ),
    );
  }
}
