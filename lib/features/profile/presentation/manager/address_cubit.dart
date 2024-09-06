import 'package:ez_eat/features/profile/domain/use_cases/get_address_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/use_cases/upload_address_usecase.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(
      {required this.getAddressUseCase, required this.uploadAddressUseCase})
      : super(AddressInitial());
  static AddressCubit get(context) => BlocProvider.of(context);

  final GetAddressUseCase getAddressUseCase;
  final UploadAddressUseCase uploadAddressUseCase;

  void getAddress() async {
    emit(GetAddressLoadingState());
    var result = await getAddressUseCase.call();
    result.fold((l) {
      emit(GetAddressErrorState(l.message));
    }, (r) {
      GetAddressSuccessState.set(addressEntity: r);
      emit(GetAddressSuccessState());
    });
  }

  void uploadAddress({required AddressEntity addressEntity}) async {
    emit(UploadAddressLoadingState());
    var result = await uploadAddressUseCase.call(addressEntity);
    result.fold((l) {
      emit(UploadAddressErrorState(l.message));
    }, (r) {
      emit(UploadAddressSuccessState());
    });
  }
}
