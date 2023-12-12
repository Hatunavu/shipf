import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

final List<AddressDataResponse> listAddress = [
  AddressDataResponse(
    id: '1',
    codes: AddressCode(district: '686', province: '62', ward: '10851'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0987654321',
    fullName: 'Vu Truong Nam',
    details: '234 Chiến Thắng',
    isDeleted: false,
    isDefault: true,
    fullAddress: '234 Chiến Thắng, Phường 2, Tân Bình, Hồ Chí Minh',
    type: 'Văn phòng',
  ),
  AddressDataResponse(
    id: '2',
    codes: AddressCode(district: '724', province: '63', ward: '11598'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0988888888',
    fullName: 'Nam Vu',
    details: '123 Hoàng Quốc Việt',
    isDeleted: false,
    isDefault: false,
    fullAddress: '123 Hoàng Quốc Việt, Cổ Nhuế 2, Bắc Từ Liêm, Hà Nội',
    type: 'Nhà',
  ),
];

class AddressScreen extends StatefulWidget {
  Function(AddressDataResponse address) selectAddress;
  AddressScreen({Key? key, required this.selectAddress}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Chọn địa chỉ',
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(kDefaultPaddingHeightWidget),
            //   child: PrimaryButton(
            //     label: 'Thêm địa chỉ',
            //     onPressed: () {
            //       context.router.push(AddAddressPage());
            //     },
            //   ),
            // ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listAddress.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        widget.selectAddress(listAddress[index]);
                        context.router.pop();
                      },
                      child: itemAddress(listAddress[index]));
                })
          ],
        ),
      ),
    );
  }

  Widget itemAddress(AddressDataResponse address) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: borderColor, width: 0.2))),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      padding: EdgeInsets.only(
          left: kDefaultPaddingWidthScreen,
          bottom: kDefaultPaddingHeightWidget),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: kDefaultPaddingHeightScreen),
            child: const Icon(
              Ionicons.location,
              color: primaryColor,
            ),
          ),
          SizedBox(
            width: kDefaultPaddingWidthScreen,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            address.fullName,
                            style: primaryTitleStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: kDefaultPaddingWidthWidget),
                          child: Text(
                            address.phone,
                            style: textBody.copyWith(color: greyText),
                          ),
                        )
                      ],
                    )),
                    GestureDetector(
                      onTap: () {
                        // context.router.push(AddAddressPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPaddingWidthWidget,
                                vertical: kDefaultPaddingHeightScreen)
                            .copyWith(right: kDefaultPaddingWidthScreen),
                        color: Colors.transparent,
                        child: Text(
                          // 'Chỉnh sửa',
                          '',
                          style: textBody.copyWith(color: primaryColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: kDefaultPaddingWidthScreen),
                child: Text(address.fullAddress),
              ),
              Padding(
                padding: EdgeInsets.only(top: address.isDefault ? 5.h : 0),
                child: Row(
                  children: [
                    Visibility(
                      visible: address.isDefault,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink, width: 0.5),
                            borderRadius: BorderRadius.circular(3.r)),
                        child: Text(
                          'Địa chỉ giao hàng mặc định',
                          style: primarySubTitleStyle.copyWith(
                              color: Colors.pink, fontSize: 11.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
