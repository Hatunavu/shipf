import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipf/data/model/order/order_service.dart';
import 'package:shipf/enums/enum_order_type.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderFeeWidget extends StatelessWidget {
  final OrderCubit cubit;
  final OrderState orderState;
  final int? shipmentId;
  final Function()? onBack;
  const OrderFeeWidget(
      {super.key,
      required this.cubit,
      required this.orderState,
      this.shipmentId,
      this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Text(
            text.service,
            style: textHeading,
          ),
        ),
        orderState.isGettingService
            ? shimmerService()
            : orderState.orderServices.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'Không tìm thấy dịch vụ phù hợp',
                        style: textBody,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPaddingWidthWidget,
                        ),
                        shrinkWrap: true,
                        itemCount: orderState.orderServices.length,
                        itemBuilder: (context, index) {
                          return serviceItem(orderState.orderServices[index]);
                        }),
                  ),
        Padding(
          padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget,
                  vertical: kDefaultPaddingHeightScreen)
              .copyWith(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
                child: const Divider(
                  height: 0,
                ),
              ),
              Text(
                text.other_fee,
                style: textHeading,
              ),
              VerticalSpace(
                kDefaultPaddingHeightScreen,
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  otherFeeItem(
                      name: text.total_loading_price,
                      fee: orderState.serviceSelected?.loadingFee.toString() ??
                          '0'),
                  otherFeeItem(
                      name: text.insurance_fee,
                      fee:
                          orderState.serviceSelected?.insuranceFee.toString() ??
                              '0')
                ],
              ),
            ],
          ),
        ),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget,
                  vertical: kDefaultPaddingHeightScreen)
              .copyWith(bottom: 0),
          child: Column(
            children: [
              otherFeeItem(name: text.cod, fee: orderState.codController!.text),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    text.total_price,
                    style: textHeading.copyWith(fontWeight: FontWeight.w500),
                  )),
                  Text(
                    orderState.serviceSelected?.serviceFee.toString() ?? '',
                    style:
                        primaryHeaderTitleStyle.copyWith(color: primaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(kDefaultPaddingWidthWidget),
          child: PrimaryButton(
            label: shipmentId != null ? 'Cập nhật' : text.create_order,
            backgroundColor: orderState.serviceSelected != null
                ? primaryColor
                : Colors.grey[300],
            onPressed: orderState.serviceSelected == null
                ? null
                : () async {
                    final bool success =
                        await cubit.createOrder(shipmentId: shipmentId);
                    if (success && shipmentId == null) {
                      context.router.push(const OrderSuccessPage());
                    } else if (success) {
                      context.router.pop();
                      onBack!.call();
                    }
                  },
          ),
        ),
      ],
    );
  }

  Widget serviceItem(OrderServiceData service) {
    return GestureDetector(
      onTap: () {
        cubit.selectService(service);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPaddingWidthScreen,
            vertical: kDefaultPaddingHeightScreen),
        decoration: BoxDecoration(
            color: service.isSelect
                ? primaryColor.withOpacity(0.05)
                : backgroundTextField,
            border: Border.all(
                color: service.isSelect
                    ? primaryColor
                    : greyText.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Row(
          children: [
            Icon(
              service.isSelect
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: service.isSelect ? primaryColor : greyText,
            ),
            HorizontalSpace(
              kDefaultPaddingWidthWidget / 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          service.name,
                          style: primaryTitleStyle,
                        ),
                      ),
                      SizedBox(
                        width: kDefaultPaddingWidthScreen / 2,
                      ),
                      Text(
                        service.serviceFee.toString(),
                        style: textHeading.copyWith(color: primaryColor),
                      )
                    ],
                  ),
                  VerticalSpace(
                    kDefaultPaddingHeightScreen / 2,
                  ),
                  Text(
                    service.type.display(),
                    style: textBody.copyWith(fontSize: 12.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget otherFeeItem({required String name, required String fee}) {
    return Padding(
      padding: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
      child: Row(
        children: [
          Expanded(
              child: Text(
            name,
            style: textHeading.copyWith(fontWeight: FontWeight.w500),
          )),
          Text(
            '$fee đ',
            style: textBody.copyWith(fontSize: 16.sp),
          )
        ],
      ),
    );
  }

  Widget shimmerService() {
    return Expanded(
      child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.4),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthWidget)
                        .copyWith(bottom: kDefaultPaddingHeightScreen),
                height: 0.1.sh,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius)),
              );
            },
          )),
    );
  }
}
