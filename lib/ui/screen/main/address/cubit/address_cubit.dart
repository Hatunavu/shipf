import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/address/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState.initial());
}
