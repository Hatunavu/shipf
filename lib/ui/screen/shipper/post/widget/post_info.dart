import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class PostInfo extends StatelessWidget {
  final PostData postData;

  const PostInfo({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            children: postData.tags.map((tag) {
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
        ]);
  }
}
