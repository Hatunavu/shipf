import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/account/account_model.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/setting/cubit/setting_cubit.dart';
import 'package:shipf/ui/screen/main/setting/cubit/setting_state.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<String> settings = [
    'Đổi mật khẩu',
    'Sổ địa chỉ',
    'Chính sách và điều khoản'
  ];
  bool isLoading = false;
  late SettingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..getUserInfo(),
      child: BlocConsumer<SettingCubit, SettingState>(
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
          cubit = context.read<SettingCubit>();

          return BaseScreen(
              title: 'Cài đặt',
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              child: state.isFirstLoad
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          mainInfo(state.userInfo),
                          settingList(),
                          logout(),
                          VerticalSpace(kDefaultPaddingHeightWidget),
                          deleteUser(context)
                        ],
                      ),
                    ));
        },
      ),
    );
  }

  Widget mainInfo(AccountData? userInfo) {
    return GestureDetector(
      onTap: () {
        context.router.push(UpdateInfoPage());
      },
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthScreen,
            vertical: kDefaultPaddingHeightScreen),
        padding: EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen)
            .copyWith(right: kDefaultPaddingWidthScreen),
        child: Row(
          children: [
            Container(
                width: 0.2.sw,
                height: 0.2.sw,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPaddingWidthScreen),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ImageCreator.imageWithPlaceHolder(
                    url:
                        "https://mdbootstrap.com/img/Photos/Horizontal/Nature/full%20page/img(20).webp",
                    placeHolderAssetUri: AppPath.placeholderAvatar,
                    maxHeight: 400,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userInfo?.name ?? '',
                  style: textHeading,
                ),
                VerticalSpace(kDefaultPaddingHeightScreen / 2),
                Text(
                  userInfo?.phone ?? '',
                  style: textBody,
                ),
              ],
            )),
            Icon(
              Icons.arrow_forward_ios,
              color: greyText,
              size: textSize,
            )
          ],
        ),
      ),
    );
  }

  Widget settingList() {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthScreen,
          vertical: kDefaultPaddingHeightScreen),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  ToastUtils.showNeutral('Tính năng đăng được phát triển');
                },
                child: settingItem(settings[index]));
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingHeightScreen),
              child: const Divider(
                height: 0,
              ),
            );
          },
          itemCount: settings.length),
    );
  }

  Widget settingItem(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: kDefaultPaddingHeightWidget,
          horizontal: kDefaultPaddingWidthWidget),
      child: Text(
        label,
        style: textHeading.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget logout() {
    return GestureDetector(
      onTap: () {
        AccountServices().saveUserToken('');
        appCubit.updateRole(RoleType.logout);
        context.router.push(MainPage());
      },
      child: Container(
        decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        margin: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthScreen,
            vertical: kDefaultPaddingHeightScreen),
        padding: EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Đăng xuất',
              style: textBody.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteUser(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        deleteDialog('Bạn có muốn xóa tài khoản này?');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
        child: Text(
          'Xóa tài khoản',
          style: textBody.copyWith(color: Colors.red),
        ),
      ),
    );
  }

  void deleteDialog(String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              insetPadding:EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget) ,
              titlePadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightScreen,
                  horizontal: kDefaultPaddingWidthWidget),
              contentPadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightWidget,
                  horizontal: kDefaultPaddingWidthScreen),
              content: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton.grey(
                      label: 'Hủy',
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                  HorizontalSpace(kDefaultPaddingWidthScreen),
                  Expanded(
                    flex: 1,
                    child: PrimaryButton.outline(
                      onPressed: () async {
                        final success = await cubit.deleteUser();
                        success ? context.router.push(LoginPage()) : null;
                      },
                      label: 'Xóa',
                      borderColor: Colors.red,
                      textColor: Colors.red,
                    ),
                  )
                ],
              ));
        });
  }
}
