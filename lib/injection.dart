import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shipf/data/remote/dio_di.dart';
import 'package:shipf/data/repository/auth/auth_repository.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/widget/toast.dart';

final getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());
  appCubit = getIt.get<AppCubit>();
  getIt.registerLazySingleton<Dio>(() => _DioDi().dio);
  getIt.registerLazySingleton<IToast>(() => CustomBotToast());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(
        getIt.get<Dio>(),
        baseUrl: ApiConstants.baseUrl,
      ));
  getIt.registerLazySingleton<MainRepository>(() => MainRepository(
        getIt.get<Dio>(),
        baseUrl: ApiConstants.baseUrl,
      ));
  mainRepository = getIt.get<MainRepository>();
  getIt.registerSingleton<AppRouter>(AppRouter());
}

class _DioDi extends DioDi {}
