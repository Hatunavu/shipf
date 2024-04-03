import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/foundation/extension/string_formatting.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class PostItem extends StatelessWidget {
  final PostData postData;
  PostItem({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    final List<Tag> tags = [
      ...postData.pickupProvinces.map((e) => Tag(tagName: e.name)).toList(),
      ...postData.deliveryProvinces
          .map((e) => Tag(tagName: e.name, isPickup: false))
          .toList(),
    ];
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: kDefaultPaddingWidthScreen),
                    height: 30.w,
                    width: 30.w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: ImageCreator.assetImage(
                        imagePath: AppPath.placeholderAvatar,
                        fit: BoxFit.cover,
                      ),
                    )),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        postData.owner?.name ?? '',
                        style: primaryTitleStyle,
                      ),
                      VerticalSpace(3.h),
                      Text(
                        postData.createdTime,
                        style: primarySubTitleStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
            VerticalSpace(kDefaultPaddingHeightScreen / 2),
            Wrap(
              children: tags.map((tag) {
                return Container(
                  margin: EdgeInsets.only(bottom: 2.h, right: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: darkContentColor,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 6.h, horizontal: kDefaultPaddingWidthScreen),
                  child: Text(
                    tag.tagName,
                    style: primarySubTitleStyle.copyWith(
                        color: tag.isPickup ? primaryColor : Colors.grey[500]),
                  ),
                );
              }).toList(),
            ),
            VerticalSpace(kDefaultPaddingHeightScreen),
            Text(postData.content),
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
            )
          ]),
    );
  }
}
