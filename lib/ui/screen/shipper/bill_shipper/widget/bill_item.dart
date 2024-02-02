import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class BillItem extends StatelessWidget {
  final Function? cancelTransit;
  final Function? acceptTransit;
  final ShipmentData shipment;
  const BillItem(
      {super.key,
      this.acceptTransit,
      this.cancelTransit,
      required this.shipment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
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
                  child: Text('Mã chuyến: ${shipment.code}',
                      style: textBody.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600))),
              Text(
                shipment.currentShipmentStatusTracking?.shipmentStatus?.code
                        .display() ??
                    '',
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
                  'Vu Truong Nam-0987654321',
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
                  '9 Phạm Văn Đồng, Mai Dịch, Cầu Giấy, Hà Nội',
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
                    shipment.note,
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
                  shipment.updatedTime,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: textBottomBar.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
                  '100.000đ',
                  style: textHeading.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
