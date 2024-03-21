import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class UserPostItem extends StatelessWidget {
  final PostData postData;
  UserPostItem({super.key, required this.postData});

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
          color: Color.lerp(postData.status.color(), Colors.white, 0.9),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            postData.status.display(),
                            style: primaryTitleStyle.copyWith(
                                color: postData.status.color()),
                          ),
                        ],
                      ),
                      VerticalSpace(3.h),
                      Text(
                        postData.createdTime,
                        style: primarySubTitleStyle,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: postData.status == PostStatusType.neww,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          ToastUtils.showNeutral(
                              'Tính năng đăng được phát triển');
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
                          ToastUtils.showNeutral(
                              'Tính năng đăng được phát triển');
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
                          postData.status == PostStatusType.draft
                              ? Ionicons.pencil_outline
                              : Ionicons.copy_outline,
                          size: 12.sp,
                        ),
                        HorizontalSpace(2.w),
                        Text(
                          postData.status == PostStatusType.draft
                              ? 'Sửa'
                              : 'Sao chép',
                          style: primarySubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            )
          ]),
    );
  }
}
