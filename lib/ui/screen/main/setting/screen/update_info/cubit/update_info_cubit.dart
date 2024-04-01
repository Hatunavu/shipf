import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_noti_config.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit() : super(UpdateInfoState.initial());

  Future<void> updateProvince(List<AddressDataModel> provinces,
      {bool isDelivery = false}) async {
    if (isDelivery) {
      emit(state.copyWith(
          selectedProvincesDeliver: provinces, errorProvinceDeliver: ''));
    } else {
      emit(state.copyWith(selectedProvinces: provinces, errorProvince: ''));
    }
  }

  Future<void> updateProvinceError({bool isDelivery = false}) async {
    if (isDelivery) {
      emit(
          state.copyWith(errorProvinceDeliver: 'Vui lòng chọn Tỉnh/Thành phố'));
    } else {
      emit(state.copyWith(errorProvince: 'Vui lòng chọn Tỉnh/Thành phố'));
    }
  }

  Future<void> updateTonnage(TonnageType tonnage) async {
    // List<String> newList = tonnages.map((e) => e.toJsonString()).toList();
    // newList.sort((a, b) => a.compareTo(b));
    // List<TonnageType> newTonnages =
    //     newList.map((e) => stringToTonnageType(e)).toList();
    emit(state.copyWith(tonnage: tonnage));
  }

  Future<void> updateNotiConfig(NotiConfig? notiConfig) async {
    emit(state.copyWith(notiConfig: notiConfig));
  }
}
