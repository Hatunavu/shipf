import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shimmer/shimmer.dart';

class DestinationShimmer extends StatelessWidget {
  const DestinationShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Expanded(
                child: SingleChildScrollView(
              child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 16.h, top: 16.h),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: 3,
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, index) {
                            return destinationItemShimmer(context, true);
                          }))),
            )),
          ])),
    );
  }

  Widget destinationItemShimmer(BuildContext context, bool isFullWidth) {
    return Container(
      width: isFullWidth == true
          ? MediaQuery.of(context).size.width - 20.w
          : MediaQuery.of(context).size.width * .75,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 0.5,
                blurRadius: 1,
                offset: const Offset(1, 2))
          ]),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150.w,
                height: 16.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r)),
              ),
              Container(
                width: 50.w,
                height: 16.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r)),
              )
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r)),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                  child: Container(
                height: 20.h,
                width: 200.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r)),
              ))
            ],
          )
        ],
      ),
    );
  }
}
