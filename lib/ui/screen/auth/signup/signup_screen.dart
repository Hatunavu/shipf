import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/constant.dart';
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

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _mailPassController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isButtonPressed = false;
  bool isLoading = false;
  late SignupCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        unfocus(context);
      }),
      child: BlocProvider(
        create: (context) => SignupCubit(),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (!state.isLoading) {
              isLoading == true ? context.router.pop() : null;
              isLoading = false;
            }
            if (state.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                loadingShowDialog(context);
                isLoading = true;
              });
            }
          },
          builder: (context, state) {
            cubit = context.read<SignupCubit>();
            return Scaffold(
                appBar: primaryAppBar(context: context, title: text.register),
                backgroundColor: backgroundColor,
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            const SizedBox(),
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kDefaultPaddingWidthWidget,
                                      vertical: kDefaultPaddingHeightWidget),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          kDefaultBorderRadius)),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          roleItem(),
                                          roleItem(role: RoleType.shipper),
                                          roleItem(role: RoleType.business)
                                        ],
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightWidget,
                                      ),
                                      PrimaryTextField(
                                        controller: _nameController,
                                        label: '',
                                        maxLines: 1,
                                        hintText: text.full_name,
                                        fieldRequire: text.full_name,
                                        isName: true,
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightScreen,
                                      ),
                                      PrimaryTextField(
                                        errorText: state.error
                                                .toUpperCase()
                                                .contains(
                                                    text.phone.toUpperCase())
                                            ? state.error
                                            : '',
                                        isPhone: true,
                                        controller: _phoneController,
                                        label: '',
                                        hintText: text.phone,
                                        callBack: () => cubit.updateError(''),
                                      ),
                                      Visibility(
                                        visible:
                                            state.role == RoleType.business,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  kDefaultPaddingHeightScreen,
                                            ),
                                            PrimaryTextField(
                                              errorText: state.error
                                                      .toUpperCase()
                                                      .contains(text.email
                                                          .toUpperCase())
                                                  ? state.error
                                                  : '',
                                              isEmail: true,
                                              controller: _mailPassController,
                                              label: '',
                                              hintText: text.email,
                                              callBack: () =>
                                                  cubit.updateError(''),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightScreen,
                                      ),
                                      PrimaryTextField(
                                        // errorText: state.error,
                                        isPass: state.showPass,
                                        controller: _passController,
                                        label: '',
                                        maxLines: 1,
                                        hintText: text.password,
                                        showPass: () => cubit.showPass(),
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightWidget,
                                      ),
                                      PrimaryButton(
                                        backgroundColor: state.isAgreeTerms
                                            ? primaryColor
                                            : Colors.grey[300],
                                        label: text.register,
                                        onPressed: state.isAgreeTerms
                                            ? () async {
                                                unfocus(context);
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  final success = await cubit
                                                      .register(RegisterRequest(
                                                          name: _nameController
                                                              .text,
                                                          password:
                                                              _passController
                                                                  .text,
                                                          phone:
                                                              _phoneController
                                                                  .text,
                                                          email:
                                                              _mailPassController
                                                                  .text));
                                                  success
                                                      ? context.router
                                                          .push(LoginPage())
                                                      : null;
                                                }
                                              }
                                            : null,
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightWidget,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cubit.updateAgreeTerms();
                                        },
                                        behavior: HitTestBehavior.translucent,
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
                                              width: kDefaultPaddingWidthWidget,
                                              child: Checkbox(
                                                value: state.isAgreeTerms,
                                                onChanged: (_) {
                                                  cubit.updateAgreeTerms();
                                                },
                                                activeColor: primaryColor,
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Tôi đồng ý với cá Điều khoản và điều kiện và Chính sách bảo mật',
                                              ),
                                            )
                                          ],
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
                                  textSpan1: text.have_account,
                                  textSpan2: text.login,
                                  onTap: () => context.router.pop(),
                                ),
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
                  right: role == RoleType.business
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
