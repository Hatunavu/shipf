import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/foundation/app_path.dart';
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
    final tags = [
      ...postData.pickupProvinces.map((e) => e.name).toList(),
      ...postData.deliveryProvinces.map((e) => e.name).toList(),
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
                        'Nguyen Van A',
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
                GestureDetector(
                  onTap: () {
                    ToastUtils.showNeutral('Tính năng đăng được phát triển');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Icon(
                      Icons.share,
                      size: 16.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ToastUtils.showNeutral('Tính năng đăng được phát triển');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Icon(
                      Icons.favorite_border,
                      size: 16.sp,
                    ),
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
                      color: darkContentColor),
                  padding: EdgeInsets.symmetric(
                      vertical: 6.h, horizontal: kDefaultPaddingWidthScreen),
                  child: Text(
                    tag,
                    style: primarySubTitleStyle,
                  ),
                );
              }).toList(),
            ),
            VerticalSpace(kDefaultPaddingHeightScreen),
            Text(postData.content),
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    ToastUtils.showNeutral('Tính năng đăng được phát triển');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPaddingHeightScreen,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.chatbox_outline,
                          size: 12.sp,
                        ),
                        HorizontalSpace(2.w),
                        Text(
                          'Báo cáo',
                          style: primarySubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    ToastUtils.showNeutral('Tính năng đăng được phát triển');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: kDefaultPaddingHeightScreen,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.send_outline,
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
                )),
                Expanded(
                    child: GestureDetector(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.phone_outlined,
                          size: 12.sp,
                        ),
                        HorizontalSpace(2.w),
                        Text(
                          'Gọi',
                          style: primarySubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            )
          ]),
    );
  }
}
