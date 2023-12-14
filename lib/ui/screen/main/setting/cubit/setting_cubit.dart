import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/setting/cubit/setting_state.dart';

class SystemCubit extends Cubit<SettingState> {
  SystemCubit() : super(SettingState.initial());
}
