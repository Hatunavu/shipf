import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/constant.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/horizontal_space.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderFeeWidget extends StatelessWidget {
  const OrderFeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        service(),
        VerticalSpace(
          kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Column(
            children: [
              otherFeeItem(name: text.cod, fee: '0'),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    text.total_price,
                    style: textHeading.copyWith(fontWeight: FontWeight.w500),
                  )),
                  Text(
                    '70.000 đ',
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
            label: text.create_order,
            onPressed: () {
              // orderCubit.updateStepOrder(StepOrderType.parcel);
            },
          ),
        )
      ],
    );
  }

  Widget service() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text.service,
            style: textHeading,
          ),
          VerticalSpace(
            kDefaultPaddingHeightScreen,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return serviceItem(isActive: index == 0);
              }),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: kDefaultPaddingHeightScreen),
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
              otherFeeItem(name: text.loading_price, fee: '0'),
              otherFeeItem(name: text.total_loading_price, fee: '0'),
              otherFeeItem(name: text.insurance_fee, fee: '0')
            ],
          )
        ],
      ),
    );
  }

  Widget serviceItem({bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPaddingHeightScreen),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthScreen,
          vertical: kDefaultPaddingHeightScreen),
      decoration: BoxDecoration(
          color:
              isActive ? primaryColor.withOpacity(0.05) : backgroundTextField,
          border: Border.all(
              color: isActive ? primaryColor : greyText.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      child: Row(
        children: [
          Icon(
            isActive ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isActive ? primaryColor : greyText,
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
                        'TV HN - vùng 1 12kg',
                        style: primaryTitleStyle,
                      ),
                    ),
                    SizedBox(
                      width: kDefaultPaddingWidthScreen / 2,
                    ),
                    Text(
                      '70.000đ',
                      style: textHeading.copyWith(color: primaryColor),
                    )
                  ],
                ),
                VerticalSpace(
                  kDefaultPaddingHeightScreen / 2,
                ),
                Text(
                  'Giao ghép hàng',
                  style: textBody.copyWith(fontSize: 12.sp),
                )
              ],
            ),
          )
        ],
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
}
