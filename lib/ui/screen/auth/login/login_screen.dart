// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/login/cubit/login_cubit.dart';
import 'package:shipf/ui/screen/auth/login/cubit/login_state.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  bool isLoading = false;
  late LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: BlocProvider(
        create: (context) =>
            LoginCubit(getIt.get<MainRepository>(), getIt.get<AppCubit>()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (!state.isLoading) {
              isLoading == true ? context.router.pop() : null;
            }
            if (state.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                loadingShowDialog(context);
                isLoading = true;
              });
            }
          },
          builder: (context, state) {
            cubit = context.read<LoginCubit>();
            return Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthWidget),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.25.sw),
                            child: ImageCreator.assetImage(
                                imagePath: AppPath.slogan),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddingWidthWidget,
                                    vertical: kDefaultPaddingHeightWidget),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius)),
                                child: Column(
                                  children: [
                                    Text(
                                      text.login,
                                      style: primaryHeaderTitleStyle,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    Row(
                                      children: [
                                        roleItem(),
                                        roleItem(role: RoleType.shipper),
                                        roleItem(role: RoleType.bussiness)
                                      ],
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget * 2,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPhone: true,
                                      label: '',
                                      hintText: text.phone,
                                      controller: _phoneController,
                                      isValidate: true,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryButton(
                                      backgroundColor: state.isAgreeTerms
                                          ? primaryColor
                                          : Colors.grey[300],
                                      label: 'Tiếp tục',
                                      onPressed: () async {
                                        unfocus(context);
                                        if (state.error != null &&
                                            _formKey.currentState!.validate()) {
                                          final isLogin = await cubit
                                              .sendPhone(_phoneController.text);
                                          if (isLogin) {
                                            context.router.push(EnterPassPage(
                                                phone: _phoneController.text));
                                          } else {
                                            context.router.push(VerifyPage(
                                                email: _phoneController.text,
                                                isSignup: true));
                                          }
                                        } else {
                                          cubit.updateError(
                                              'Số điện thoại không đúng');
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget * 2,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cubit.updateAgreeTerms();
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    right:
                                                        kDefaultPaddingWidthScreen),
                                                height:
                                                    kDefaultPaddingWidthWidget,
                                                width:
                                                    kDefaultPaddingWidthWidget,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: state.isAgreeTerms
                                                        ? primaryColor
                                                        : Colors.white,
                                                    border: Border.all(
                                                        color: primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.r)),
                                                child: Icon(
                                                  Icons.done,
                                                  size:
                                                      kDefaultPaddingWidthWidget,
                                                  color: Colors.white,
                                                )),
                                            const Expanded(
                                              child: Text(
                                                'Tôi đồng ý với cá Điều khoản và điều kiện và Chính sách bảo mật',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(),
                          Column(
                            children: [
                              CustomRichtext(
                                  textSpan1: state.role == RoleType.bussiness
                                      ? 'Chưa có tài khoản ${state.role.display()}?'
                                      : '',
                                  textSpan2: state.role == RoleType.bussiness
                                      ? text.register
                                      : '',
                                  widgetNavigator: SignupPage()),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget roleItem({RoleType role = RoleType.customer}) {
    final bool isActive = cubit.state.role == role;
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          cubit.updateRole(role);
          appCubit.updateRole(role);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              color: isActive ? primaryColor : Colors.white,
              borderRadius: BorderRadius.horizontal(
                  left: role == RoleType.customer
                      ? Radius.circular(defaultBorderRadius)
                      : Radius.zero,
                  right: role == RoleType.bussiness
                      ? Radius.circular(defaultBorderRadius)
                      : Radius.zero)),
          child: Text(
            role.display(),
            style: primarySubTitleStyle.copyWith(
              color: isActive ? Colors.white : primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
