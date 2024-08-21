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
        if(state is GetAddressSuccessState){
          address = GetAddressSuccessState.addressEntity;
        }
      },
      builder: (context, state) {
        if(state is GetAddressSuccessState || address.isNotEmpty){
          return Expanded(
            child: GridView.builder(

              itemBuilder: (context, index) =>
                  AddressCard(addressEntity: address[index]),
              itemCount: address.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 430,
                mainAxisExtent: 220,
              ),
            ),
          );
        }else if(state is GetAddressErrorState){
          return Text(state.errMessage);
        }
        else{
          return  const Center(child: CircularProgressIndicator());

        }

      },
    );
  }
}
