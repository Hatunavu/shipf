// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/reset_pass/cubit/reset_pass_cubit.dart';
import 'package:shipf/ui/screen/auth/reset_pass/cubit/reset_pass_state.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class ResetPassScreen extends StatelessWidget {
  final String phone;
  final bool isSignup;
  ResetPassScreen({Key? key, required this.phone, this.isSignup = false})
      : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool isLoading = false;
  late ResetPassCubit cubit;

  @override
  Widget build(BuildContext context) {
    _phoneController.text = phone;
    final text = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: BlocProvider(
        create: (context) =>
            ResetPassCubit(getIt.get<MainRepository>(), getIt.get<AppCubit>()),
        child: BlocConsumer<ResetPassCubit, ResetPassState>(
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
            cubit = context.read<ResetPassCubit>();
            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: primaryAppBar(context: context, title: text.verify),
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
                                      isSignup
                                          ? 'Tạo mật khẩu'
                                          : 'Đổi mật khẩu',
                                      style: primaryHeaderTitleStyle,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      readOnly: true,
                                      isPhone: true,
                                      label: '',
                                      hintText: text.phone,
                                      controller: _phoneController,
                                      isValidate: true,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPass: true,
                                      label: '',
                                      hintText: text.password,
                                      controller: _passController,
                                      isValidate: true,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPass: true,
                                      label: '',
                                      hintText: text.confirm_password,
                                      controller: _confirmPassController,
                                      isValidate: true,
                                      passConfirm: _passController.text,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryButton(
                                      backgroundColor: primaryColor,
                                      label: 'Hoàn tất',
                                      onPressed: () async {
                                        unfocus(context);
                                        if (_formKey.currentState!.validate()) {
                                          AccountServices()
                                              .saveUserToken('token');
                                          context.router.push(MainPage());
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(),
                          const SizedBox(),
                          const SizedBox(),
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
}
