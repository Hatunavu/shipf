// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/auth/auth.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/auth/forget_pass/cubit/forget_pass_cubit.dart';
import 'package:shipf/ui/screen/auth/forget_pass/cubit/forget_pass_state.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/appbar/primary_appbar.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/theme/constant.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool isLoading = false;
  late ForgetPassCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus(context);
      },
      child: BlocProvider(
        create: (context) => ForgetPassCubit(),
        child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
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
            cubit = context.read<ForgetPassCubit>();
            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: primaryAppBar(context: context, title: 'Quên mật khẩu'),
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
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPhone: true,
                                      label: '',
                                      hintText: text.phone,
                                      controller: _phoneController,
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPass: state.showPass,
                                      label: '',
                                      hintText: text.password,
                                      controller: _passController,
                                      showPass: () => cubit.showPass(),
                                      callBack: () => cubit.updateError(''),
                                    ),
                                    SizedBox(
                                      height: kDefaultPaddingHeightWidget,
                                    ),
                                    PrimaryTextField(
                                      errorText: state.error,
                                      isPass: state.showConfirmPass,
                                      label: '',
                                      hintText: text.confirm_password,
                                      controller: _confirmPassController,
                                      passConfirm: _passController.text,
                                      showPass: () => cubit.showConfirmPass(),
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
                                          final success = await cubit.submit(
                                              ForgetPassRequest(
                                                  password:
                                                      _passController.text,
                                                  phone:
                                                      _phoneController.text));

                                          success
                                              ? context.router
                                                  .push(MainPage(tabIndex: 1))
                                              : null;
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
