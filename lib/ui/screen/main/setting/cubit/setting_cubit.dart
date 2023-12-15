import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/setting/cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());
}
