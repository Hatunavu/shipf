import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderFeeWidget extends StatelessWidget {
  const OrderFeeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dịch vụ',
                style: textHeading,
              ),
              SizedBox(
                height: kDefaultPaddingHeightScreen,
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
                'Phí khác',
                style: textHeading,
              ),
              SizedBox(
                height: kDefaultPaddingHeightScreen,
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  otherFee(name: 'Giá bốc xếp/tấn/chiều', fee: '0'),
                  otherFee(name: 'Tổng giá bốc xếp', fee: '0'),
                  otherFee(name: 'Phí bảo hiểm', fee: '0')
                ],
              )
            ],
          ),
        ),
        Divider(
          thickness: kDefaultPaddingHeightScreen,
          color: backgroundColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthWidget,
              vertical: kDefaultPaddingHeightScreen),
          child: Column(
            children: [
              otherFee(name: 'COD', fee: '0'),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Tổng cước',
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
            label: 'Tạo đơn',
            onPressed: () {
              // orderCubit.updateStepOrder(StepOrderType.parcel);
            },
          ),
        )
      ],
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
          SizedBox(
            width: kDefaultPaddingWidthWidget / 2,
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
                SizedBox(
                  height: kDefaultPaddingHeightScreen / 2,
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

  Widget otherFee({required String name, required String fee}) {
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
