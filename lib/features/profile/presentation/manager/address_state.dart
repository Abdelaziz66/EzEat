part of 'address_cubit.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class GetAddressLoadingState extends AddressState {}

class GetAddressSuccessState extends AddressState {
  static List<AddressEntity> addressEntity = [];
  static set({required List<AddressEntity> addressEntity}) {
    GetAddressSuccessState.addressEntity = addressEntity;
  }
}

class GetAddressErrorState extends AddressState {
  final String errMessage;

  GetAddressErrorState(this.errMessage);
}

class UploadAddressLoadingState extends AddressState {}

class UploadAddressSuccessState extends AddressState {}

class UploadAddressErrorState extends AddressState {
  final String errMessage;

  UploadAddressErrorState(this.errMessage);
}
