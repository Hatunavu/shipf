import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/services/account_services.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
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
  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            children: [mainInfo(), settingList(), logout()],
          ),
        ));
  }

  Widget mainInfo() {
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
                  'Nam Vu',
                  style: textHeading,
                ),
                VerticalSpace(kDefaultPaddingHeightScreen / 2),
                Text(
                  '0987654321',
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
        context.router.push(LoginPage());
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
}
