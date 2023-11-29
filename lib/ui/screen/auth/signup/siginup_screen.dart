import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/repository/main/main_repository.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_cubit.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_state.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isButtonPressed = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        unfocus(context);
      }),
      child: BlocProvider(
        create: (context) =>
            SignupCubit(getIt.get<MainRepository>(), getIt.get<AppCubit>()),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            // TODO: implement listener
            if (!state.isLoading) {
              isLoading == true ? context.router.pop() : null;
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                loadingShowDialog(context);
                isLoading = true;
              });
            }
            return Scaffold(
                appBar: primaryAppBar(context: context, title: text.register),
                backgroundColor: backgroundColor,
                body: SafeArea(
                  child: Container(
                    // height: MediaQuery.of(context).size.height -
                    //     56 -
                    //     MediaQuery.of(context).padding.vertical,
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPaddingWidthWidget,
                                      vertical: 25.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          kDefaultBorderRadius)),
                                  child: Column(
                                    children: [
                                      Text(
                                        text.register_with,
                                        style: primaryHeaderTitleStyle,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        text.email,
                                        style: primaryTitleStyle,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      PrimaryTextField(
                                        errorText: state.error,
                                        isEmail: true,
                                        controller: _mailController,
                                        label: '',
                                        hintText: text.email,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      PrimaryTextField(
                                        errorText: state.error,
                                        isPass: true,
                                        controller: _passController,
                                        label: '',
                                        maxLines: 1,
                                        hintText: text.password,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      PrimaryTextField(
                                        errorText: state.error,
                                        isPass: true,
                                        maxLines: 1,
                                        controller: _confirmPassController,
                                        label: '',
                                        hintText: text.confirm_password,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      PrimaryButton(
                                        label: text.register,
                                        onPressed: () async {
                                          unfocus(context);
                                          if (state.error != null ||
                                              _formKey.currentState!
                                                  .validate()) {
                                            // final response = await context
                                            //     .read<SignupCubit>()
                                            //     .signup(
                                            //         phone:
                                            //             _phoneController.text);
                                            // if (response != null &&
                                            //     response.status == 200) {
                                            //   context.router.push(OtpPage(
                                            //       isSignup: true,
                                            //       phone:
                                            //           _phoneController.text));
                                            // }
                                            context.router.push(VerifyPage(
                                                email: _mailController.text));
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CustomRichtext(
                                    textSpan1: text.have_account,
                                    textSpan2: text.login,
                                    widgetNavigator: LoginPage()),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
