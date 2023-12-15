import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/setting/screen/update_info/cubit/update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  UpdateInfoCubit() : super(UpdateInfoState.initial());
}
