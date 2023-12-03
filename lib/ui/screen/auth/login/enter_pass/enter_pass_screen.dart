// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/login/enter_pass/cubit/enter_pass_cubit.dart';
import 'package:shipf/ui/screen/auth/login/enter_pass/cubit/enter_pass_state.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class EnterPassScreen extends StatelessWidget {
  final String phone;
  EnterPassScreen({Key? key, required this.phone}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  bool isLoading = false;
  late EnterPassCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: BlocProvider(
        create: (context) =>
            EnterPassCubit(getIt.get<MainRepository>(), getIt.get<AppCubit>()),
        child: BlocConsumer<EnterPassCubit, EnterPassState>(
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
            cubit = context.read<EnterPassCubit>();
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
                                      'Xin chào, $phone',
                                      style: primaryHeaderTitleStyle,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context.router.push(VerifyPage(
                                                email: phone,
                                                isForgotPass: true));
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            padding: EdgeInsets.only(
                                                top:
                                                    kDefaultPaddingHeightWidget,
                                                bottom:
                                                    kDefaultPaddingHeightWidget),
                                            child: GestureDetector(
                                              child: Text(
                                                text.forgot_password,
                                                style: primarySubTitleStyle
                                                    .copyWith(
                                                        color: primaryColor),
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightScreen,
                                    ),
                                    PrimaryButton(
                                      backgroundColor: primaryColor,
                                      label: text.login,
                                      onPressed: () async {
                                        unfocus(context);
                                        if (_formKey.currentState!.validate()) {
                                          final message = await cubit.sendPass(
                                              LoginRequest(
                                                  password:
                                                      _passController.text,
                                                  phone: phone));
                                          if (message.isEmpty) {
                                            AccountServices()
                                                .saveUserToken('token');
                                            context.router.push(MainPage());
                                          }
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
