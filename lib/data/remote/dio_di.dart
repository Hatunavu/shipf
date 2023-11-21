import 'package:dio/dio.dart';
import 'package:shipf/data/remote/interceptors/auth_interceptors.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioDi {
  Dio get dio {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 5).inMilliseconds;
    dio.options.receiveTimeout = const Duration(seconds: 5).inMilliseconds;
    dio.interceptors.add(AuthInterceptor(getIt.get<AppCubit>()));
    // dio.interceptors.add(AuthInterceptor(getIt.get<AppCubit>()));
    //
    // dio.interceptors.add(MessageErrorInterceptor());
    // dio.interceptors.add(BadNetworkErrorInterceptor());
    // dio.interceptors.add(UnauthorizedErrorInterceptor());
    // dio.interceptors.add(InternalServerErrorInterceptor());
    // dio.interceptors.add(AuthIntercepßtor());
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    return dio;
  }
}
