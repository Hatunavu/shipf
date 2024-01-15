import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipf/ui/theme/constant.dart';

class OrderShimmer extends StatelessWidget {
  const OrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.4),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                      vertical: kDefaultPaddingHeightScreen,
                      horizontal: kDefaultPaddingWidthScreen)
                  .copyWith(bottom: 0),
              height: 0.25.sh,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultBorderRadius)),
            );
          },
        ));
  }
}
