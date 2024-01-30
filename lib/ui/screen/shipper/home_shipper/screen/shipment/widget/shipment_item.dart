import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/shipment/shipment_response.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/enums/enum_shipment_update.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_cubit.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class ShipmentItem extends StatelessWidget {
  final ShipmentsCubit shipmentsCubit;
  final ShipmentStatus shipmentStatus;
  final ShipmentData shipment;

  const ShipmentItem(
      {super.key,
      required this.shipmentsCubit,
      required this.shipment,
      this.shipmentStatus = ShipmentStatus.pickingUp});

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
                  child: Text('Mã đơn: ${shipment.code}',
                      style: textBody.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600))),
              Text(
                shipmentStatus.display(),
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
                  '${shipment.pickupAddress?.name}-${shipment.pickupAddress?.phone}',
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
                  shipment.pickupAddress?.fullAddress ?? '',
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
                  shipment.createdTime,
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
                  shipment.totalFee,
                  style: textHeading.copyWith(
                      color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          deliveryAction(context, shipment: shipment)
        ],
      ),
    );
  }

  Widget deliveryAction(BuildContext context,
      {required ShipmentData shipment}) {
    return Padding(
      padding: EdgeInsets.only(
          right: kDefaultPaddingWidthScreen,
          top: kDefaultPaddingHeightScreen / 2),
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton.outline(
              label: 'Sửa đơn',
              defaultHeight: true,
              onPressed: () {
                ToastUtils.showNeutral('Tính năng đăng được phát triển');
              },
            ),
          ),
          HorizontalSpace(kDefaultPaddingWidthScreen / 2),
          Expanded(
            child: PrimaryButton(
              label: 'Cập nhật',
              defaultHeight: true,
              onPressed: () {
                updateShipmentStatus(context, shipment: shipment);
              },
            ),
          ),
        ],
      ),
    );
  }

  void updateShipmentStatus(BuildContext context,
      {required ShipmentData shipment}) {
    ShipmentUpdate? dropDownValue;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kDefaultBorderRadius)),
              title: Text(
                'Cập nhật trạng thái đơn hàng ${shipment.code}',
                textAlign: TextAlign.center,
              ),
              titlePadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightScreen,
                  horizontal: kDefaultPaddingWidthWidget),
              contentPadding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightWidget,
                  horizontal: kDefaultPaddingWidthScreen),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Trạng thái'),
                  VerticalSpace(kDefaultPaddingHeightScreen),
                  StatefulBuilder(builder:
                      (BuildContext context, StateSetter dropDownState) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: kDefaultPaddingWidthScreen),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius)),
                      ),
                      child: DropdownButton(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: dropDownValue,
                        items: [
                          ShipmentUpdate.pickedUp,
                          ShipmentUpdate.faildPickup
                        ].map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value.display()),
                          );
                        }).toList(),
                        onChanged: (ShipmentUpdate? value) {
                          dropDownState(() {
                            dropDownValue = value;
                          });
                        },
                      ),
                    );
                  }),
                  VerticalSpace(kDefaultPaddingHeightWidget * 2),
                  Row(
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
                          child: PrimaryButton(
                            onPressed: () {
                              if (dropDownValue == null) {
                                ToastUtils.showFail(
                                    'Vui lòng chọn trạng thái cập nhật');
                              } else {
                                context.router.pop();
                                shipmentsCubit.updateShipmentStatus(
                                    shipmentUpdate: dropDownValue,
                                    shipmentId: shipment.id);
                              }
                            },
                            label: 'Xác nhận',
                          ))
                    ],
                  ),
                ],
              ));
        });
  }
}
