import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_cubit.dart';
import 'package:shipf/ui/screen/auth/signup/cubit/signup_state.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/richtext/custom_richtext.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SignupScreen extends StatelessWidget {
  final RoleType roleType;
  SignupScreen({Key? key, this.roleType = RoleType.customer}) : super(key: key);
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
            // TODO: implement listener
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
                            // const SizedBox(),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 0.25.sw),
                              child: ImageCreator.assetImage(
                                  imagePath: AppPath.slogan),
                            ),
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
                                      Text(
                                        'Đăng ký tài khoản ${roleType.display()}',
                                        style: primaryHeaderTitleStyle,
                                      ),
                                      SizedBox(
                                        height: kDefaultPaddingHeightScreen,
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
                                        errorText:
                                            state.error.contains(text.phone)
                                                ? state.error
                                                : '',
                                        isPhone: true,
                                        controller: _phoneController,
                                        label: '',
                                        hintText: text.phone,
                                        callBack: () => cubit.updateError(''),
                                      ),
                                      Visibility(
                                        visible: roleType == RoleType.business,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  kDefaultPaddingHeightScreen,
                                            ),
                                            PrimaryTextField(
                                              errorText: state.error
                                                      .contains(text.email)
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
                                        label: text.register,
                                        onPressed: () async {
                                          unfocus(context);
                                          if (_formKey.currentState!
                                              .validate()) {
                                            final success = roleType ==
                                                    RoleType.customer
                                                ? await cubit.registerCustomer(
                                                    RegisterRequest(
                                                        name: _nameController
                                                            .text,
                                                        password:
                                                            _passController
                                                                .text,
                                                        phone:
                                                            _phoneController
                                                                .text))
                                                : await cubit.registerBusiness(
                                                    RegisterRequest(
                                                        name:
                                                            _nameController
                                                                .text,
                                                        password:
                                                            _passController
                                                                .text,
                                                        phone: _phoneController
                                                            .text,
                                                        mail:
                                                            _mailPassController
                                                                .text));
                                            success
                                                ? context.router
                                                    .push(MainPage())
                                                : null;
                                          }
                                        },
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
                                    // onTap: ()=>context.router.pop(),
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
