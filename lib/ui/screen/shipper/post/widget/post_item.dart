import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/extension/string_formatting.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/shipper/post/widget/post_info.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class PostItem extends StatelessWidget {
  final PostData postData;
  final RoleType? role;
  const PostItem(
      {super.key, required this.postData, this.role = RoleType.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen)
          .copyWith(bottom: kDefaultPaddingHeightScreen),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen)
          .copyWith(top: kDefaultPaddingWidthScreen),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
            ),
          ]),
      child: Column(
        children: [
          PostInfo(
            postData: postData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  final url = Uri.parse('tel:${postData.contactPhone}');
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  } else {
                    ToastUtils.showFail(
                        'Đã có lỗi xảy ra, vui lòng thử lại sau!');
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: kDefaultPaddingHeightScreen,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 12.sp,
                      ),
                      HorizontalSpace(2.w),
                      Text(
                        'Gọi ${postData.contactPhone.encodePhoneNumber()}',
                        style: primarySubTitleStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: role == RoleType.shipper,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      context.router.push(QuotePage(postData: postData)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPaddingHeightScreen,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.send_outlined,
                          size: 12.sp,
                        ),
                        HorizontalSpace(2.w),
                        Text(
                          'Báo giá',
                          style: primarySubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
