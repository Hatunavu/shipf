import 'package:dio/dio.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';

class AuthInterceptor extends Interceptor {
  // Don't need stream subscription cause everytime we request, we get token
  // from cubit state and apply it to the request's header
  final AppCubit appCubit;

  AuthInterceptor(this.appCubit);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //  AppLog.info('---> ${request.method} ${request.url}');
    final userToken = await AccountServices().getUserToken();
    options.headers['X-Requested-With'] = 'XMLHttpRequest';
    options.headers['Authorization'] = 'Bearer $userToken';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      AccountServices().saveUserToken('');
      appCubit.updateRole(RoleType.logout);
      getIt<AppRouter>().push(MainPage());
      ToastUtils.showFail('Tài khoản đã hết hạn đăng nhập');
    } else if (err.response?.statusCode == 403 ||
        err.response?.statusCode == 500) {
      ToastUtils.showFail('Đã có lỗi xảy ra, vui lòng thử lại sau!');
    }
    super.onError(err, handler);
  }
}
