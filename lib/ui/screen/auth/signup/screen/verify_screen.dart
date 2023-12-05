import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/signup/screen/cubit/verify_cubit.dart';
import 'package:shipf/ui/screen/auth/signup/screen/cubit/verify_state.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class VerifyScreen extends StatelessWidget {
  final String email;
  final bool isSignup;
  final bool isForgotPass;
  VerifyScreen(
      {Key? key,
      required this.email,
      this.isSignup = false,
      this.isForgotPass = false})
      : super(key: key);
  final FocusNode _pinPutFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _pinPutController = TextEditingController();

  bool isLoading = false;
  late VerifyCubit cubit;

  final defaultPinTheme = PinTheme(
    width: 55.w,
    height: 55.w,
    textStyle: primaryHeaderTitleStyle,
    decoration: BoxDecoration(
      color: backgroundTextField,
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10.sp),
    ),
  );

  void onPress(BuildContext context) async {
    unfocus(context);
    if (formKey.currentState!.validate()) {
      final bool sucess = await context.read<VerifyCubit>().sendOtp(
          VerifyRequest(phoneNumber: email, otp: _pinPutController.text));
      if (sucess) {
        context.router.push(ResetPassPage(phone: email, isSignup: isSignup));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          // TODO: implement listener
          if (!state.isLoading) {
            isLoading == true ? context.router.pop() : null;
            isLoading = false;
          }
          if (state.error != null) {
            // button.onPressed!();
            if (formKey.currentState!.validate()) {
              print('demo');
            }
            // context.read<SigninCubit>().emit(state.copyWith(error: null));
          }
          if (state.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loadingShowDialog(context);
              isLoading = true;
            });
          }
        },
        builder: (context, state) {
          cubit = context.read<VerifyCubit>();
          return GestureDetector(
              onTap: () {
                _pinPutFocusNode.unfocus();
              },
              child: Scaffold(
                backgroundColor: backgroundColor,
                appBar: primaryAppBar(context: context, title: text!.verify),
                body: SafeArea(
                    child: Container(
                  // height: MediaQuery.of(context).size.height -
                  //     56 -
                  //     MediaQuery.of(context).padding.vertical,
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthWidget),
                  child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.25.sw),
                            child: ImageCreator.assetImage(
                                imagePath: AppPath.slogan),
                          ),
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
                                  text.verify,
                                  style: primaryHeaderTitleStyle,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  text.code_send,
                                  style: primaryTitleStyle,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  email,
                                  style: primaryTitleStyle,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  // width: 250.w,
                                  child: Pinput(
                                    pinputAutovalidateMode:
                                        PinputAutovalidateMode.disabled,
                                    forceErrorState: true,
                                    pinContentAlignment: Alignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    length: 6,
                                    autofocus: true,
                                    defaultPinTheme: defaultPinTheme,
                                    focusNode: _pinPutFocusNode,
                                    controller: _pinPutController,
                                    onTap: () => cubit.updateError(''),
                                    errorText: state.error,
                                    onSubmitted: (_) {
                                      onPress(context);
                                    },
                                    validator: (pin) {
                                      if (pin!.length == 6) {
                                        return null;
                                      }
                                      return 'Mã OTP không chính xác';
                                    },
                                    errorTextStyle:
                                        TextStyle(color: Colors.red),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomRichtext(
                                    textSpan1: text.not_receive_code,
                                    textSpan2: text.resend,
                                    widgetNavigator: LoginPage()),
                                SizedBox(
                                  height: 20.h,
                                ),
                                PrimaryButton(
                                    label: text.verify,
                                    onPressed: () => onPress(context))
                              ],
                            ),
                          ),
                          const SizedBox(),
                          const SizedBox(),
                          const SizedBox(),
                        ],
                      )),
                )),
              ));
        },
      ),
    );
  }
}
