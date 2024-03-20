import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class UserPostItem extends StatelessWidget {
  final PostStatusType postStatus;
  UserPostItem({super.key, this.postStatus = PostStatusType.approved});
  var tags = [
    "Hà Nội",
    "Bắc Ninh",
  ];

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
                            postStatus.display(),
                            style: primaryTitleStyle.copyWith(
                                color: postStatus.color()),
                          ),
                        ],
                      ),
                      VerticalSpace(3.h),
                      Text(
                        '8/3 20:00',
                        style: primarySubTitleStyle,
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: postStatus == PostStatusType.approved,
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
            Text('abc'),
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
                          postStatus == PostStatusType.pending
                              ? Ionicons.pencil_outline
                              : Ionicons.copy_outline,
                          size: 12.sp,
                        ),
                        HorizontalSpace(2.w),
                        Text(
                          postStatus == PostStatusType.pending
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
