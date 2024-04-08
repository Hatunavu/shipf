import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/transit/transit_response.dart';
import 'package:shipf/enums/enum_transit_status.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class TransitItem extends StatelessWidget {
  final Function? cancelTransit;
  final Function? acceptTransit;
  final TransitData transit;
  const TransitItem(
      {super.key,
      required this.transit,
      this.acceptTransit,
      this.cancelTransit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        border: Border.all(
            color: transit.status == TransitStatus.neww
                ? primaryColor
                : Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
              vertical: kDefaultPaddingHeightScreen,
              horizontal: kDefaultPaddingWidthScreen)
          .copyWith(right: 0),
      margin: EdgeInsets.symmetric(
              vertical: kDefaultPaddingHeightScreen,
              horizontal: kDefaultPaddingWidthScreen)
          .copyWith(bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text('Mã chuyến: ${transit.code}',
                      style: textBody.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600))),
              Text(
                transit.status.display(),
                style: textBottomBar.copyWith(
                    color: Colors.blueAccent, fontWeight: FontWeight.w500),
              ),
              HorizontalSpace(kDefaultPaddingWidthScreen)
            ],
          ),
          VerticalSpace(kDefaultPaddingHeightScreen / 2),
          Row(
            children: [
              Icon(
                Ionicons.person,
                size: textSize,
                color: primaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPaddingWidthScreen / 2),
                child: Text(
                  '${transit.customer?.name}-${transit.customer?.phone}',
                  style: textBody.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          VerticalSpace(kDefaultPaddingHeightScreen / 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Ionicons.location,
                size: textSize,
                color: primaryColor,
              ),
              HorizontalSpace(kDefaultPaddingWidthScreen / 2),
              Expanded(
                child: Text(
                  transit.pickupZone?.fullAddress ??
                      transit.deliveryZone?.fullAddress ??
                      '',
                  style: textBody,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              HorizontalSpace(kDefaultPaddingWidthScreen),

              // IconButton(
              //   padding: EdgeInsets.symmetric(
              //       vertical: kDefaultPaddingHeightScreen / 2,
              //       horizontal: kDefaultPaddingWidthScreen),
              //   constraints: const BoxConstraints(),
              //   icon: const Icon(
              //     Icons.info_outline,
              //     color: primaryColor,
              //   ),
              //   onPressed: () {
              //     ToastUtils.showNeutral('Tính năng đăng được phát triển');
              //   },
              // )
            ],
          ),
          VerticalSpace(kDefaultPaddingHeightScreen / 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Ionicons.browsers_outline,
                size: textSize,
                color: primaryColor,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPaddingWidthScreen / 2),
                  child: Text(
                    transit.note,
                    style: textBody,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          VerticalSpace(kDefaultPaddingHeightScreen / 2),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: primaryColor),
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPaddingWidthWidget / 2, vertical: 3.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Ionicons.alarm_outline,
                  color: Colors.white,
                  size: textSize,
                ),
                HorizontalSpace(kDefaultPaddingWidthScreen / 2),
                Text(
                  'Thời gian tạo: ',
                  style: textBottomBar.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  transit.createdTime,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textBottomBar.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: kDefaultPaddingWidthScreen,
                top: kDefaultPaddingHeightScreen / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng đơn',
                  style: primarySubTitleStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  transit.totalShipments.toString(),
                  style: textBody.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          VerticalSpace(kDefaultPaddingHeightScreen / 2),
          Padding(
            padding: EdgeInsets.only(right: kDefaultPaddingWidthScreen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng tiền cần thu',
                  style: primarySubTitleStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${transit.totalFee}đ',
                  style: textHeading.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Visibility(
              visible: transit.status == TransitStatus.neww,
              child: transitAction(context))
        ],
      ),
    );
  }

  Widget transitAction(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: kDefaultPaddingWidthScreen,
          top: kDefaultPaddingHeightScreen / 2),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton.grey(
              label: 'Huỷ Chuyến',
              defaultHeight: true,
              onPressed: () {
                confirmDialog(context,
                    title: 'Bạn có muốn huỷ chuyến ${transit.code} không?');
              },
            ),
          ),
          HorizontalSpace(kDefaultPaddingWidthScreen / 2),
          Expanded(
            child: PrimaryButton(
              label: 'Nhận Chuyến',
              defaultHeight: true,
              onPressed: () => confirmDialog(context,
                  title: 'Bạn có muốn nhận chuyến ${transit.code} không?',
                  isAccept: true),
            ),
          ),
        ],
      ),
    );
  }

  void confirmDialog(BuildContext context,
      {required String title, bool isAccept = false}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              insetPadding:
                  EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget),
              titlePadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightScreen,
                  horizontal: kDefaultPaddingWidthWidget),
              contentPadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightWidget,
                  horizontal: kDefaultPaddingWidthScreen),
              content: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: PrimaryButton.grey(
                      label: 'Hủy',
                      onPressed: () => context.router.pop(),
                    ),
                  ),
                  HorizontalSpace(kDefaultPaddingWidthScreen),
                  Expanded(
                    flex: 1,
                    child: isAccept
                        ? PrimaryButton(
                            onPressed: () {
                              context.router.pop();
                              acceptTransit!();
                            },
                            label: 'Xác nhận',
                          )
                        : PrimaryButton(
                            onPressed: () {
                              context.router.pop();
                              cancelTransit!();
                            },
                            label: 'Xác nhận',
                            backgroundColor: Colors.red,
                          ),
                  )
                ],
              ));
        });
  }
}
