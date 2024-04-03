import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/enums/enum_post_status.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/cubit/user_post_cubit.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class UserPostItem extends StatelessWidget {
  final UserPostCubit userPostCubit;
  final PostData postData;
  const UserPostItem(
      {super.key, required this.postData, required this.userPostCubit});

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
                    tag.tagName,
                    style: primarySubTitleStyle.copyWith(
                        color: tag.isPickup ? primaryColor : Colors.grey[500]),
                  ),
                );
              }).toList(),
            ),
            VerticalSpace(kDefaultPaddingHeightScreen),
            Text(postData.content),
            postData.status == PostStatusType.draft
                ? const SizedBox()
                : VerticalSpace(kDefaultPaddingHeightScreen),
            Visibility(
              visible: postData.status == PostStatusType.draft,
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      context.router.push(CreatePostPage(
                        postData: postData,
                        callBack: () => userPostCubit.getPosts(),
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: kDefaultPaddingHeightScreen,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Ionicons.pencil_outline,
                            size: 12.sp,
                          ),
                          HorizontalSpace(2.w),
                          Text(
                            'Sửa',
                            style: primarySubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            )
          ]),
    );
  }
}
