import 'package:ez_eat/features/profile/presentation/widgets/shimmer_address_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../manager/address_cubit.dart';
import 'address_card.dart';

class AddressGridView extends StatefulWidget {
  const AddressGridView({
    super.key,
  });

  @override
  State<AddressGridView> createState() => _AddressGridViewState();
}

class _AddressGridViewState extends State<AddressGridView> {
  List<AddressEntity> address = GetAddressSuccessState.addressEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state is GetAddressSuccessState) {
          address = GetAddressSuccessState.addressEntity;
        }
      },
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => address.isNotEmpty
              ? AddressCard(addressEntity: address[index])
              : const LoadingAddressGridView(),
          itemCount: address.isNotEmpty ? address.length : 7,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 430,
            mainAxisExtent: 235,
          ),
        );
      },
    );
  }
}
