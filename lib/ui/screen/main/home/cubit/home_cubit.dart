import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/home/cubit/home_state.dart';

const homePageAssets = "assets/data/homepage.json";

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}
