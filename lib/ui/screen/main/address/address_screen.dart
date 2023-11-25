import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address_model.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

final List<AddressDataResponse> listAddress = [
  AddressDataResponse(
    id: '1',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0987654321',
    fullName: 'Vu Truong Nam',
    details: '',
    isDeleted: false,
    isDefault: true,
    fullAddress: '9 Pham Van Dong, Mai Dich, Cau Giay, Ha Noi',
    type: 'Văn phòng',
  ),
  AddressDataResponse(
    id: '2',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '098888888',
    fullName: 'Nam Vu',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '186 đường Bưởi, Cống Vị, Ba Đình, Hà Nội',
    type: 'Nhà',
  ),
  AddressDataResponse(
    id: '1',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0987654321',
    fullName: 'Vu Truong Nam',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '9 Pham Van Dong, Mai Dich, Cau Giay, Ha Noi',
    type: 'Văn phòng',
  ),
  AddressDataResponse(
    id: '2',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '098888888',
    fullName: 'Nam Vu',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '186 đường Bưởi, Cống Vị, Ba Đình, Hà Nội',
    type: 'Nhà',
  ),
  AddressDataResponse(
    id: '1',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0987654321',
    fullName: 'Vu Truong Nam',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '9 Pham Van Dong, Mai Dich, Cau Giay, Ha Noi',
    type: 'Văn phòng',
  ),
  AddressDataResponse(
    id: '2',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '098888888',
    fullName: 'Nam Vu',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '186 đường Bưởi, Cống Vị, Ba Đình, Hà Nội',
    type: '',
  ),
  AddressDataResponse(
    id: '1',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '0987654321',
    fullName: 'Vu Truong Nam',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '9 Pham Van Dong, Mai Dich, Cau Giay, Ha Noi',
    type: 'Văn phòng',
  ),
  AddressDataResponse(
    id: '2',
    codes: AddressCode(district: '001', province: '01', ward: '0001'),
    location: AddressLocation(coordinates: [0.1, 100]),
    owner: '',
    phone: '098888888',
    fullName: 'Nam Vu',
    details: '',
    isDeleted: false,
    isDefault: false,
    fullAddress: '186 đường Bưởi, Cống Vị, Ba Đình, Hà Nội',
    type: 'Nhà',
  ),
];

class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Chọn địa chỉ giao hàng',
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
            Padding(
              padding: EdgeInsets.all(kDefaultPaddingHeightWidget),
              child: PrimaryButton(
                label: 'Thêm địa chỉ',
                onPressed: () {
                  context.router.push(AddAddressPage());
                },
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listAddress.length,
                itemBuilder: (context, index) {
                  return itemAddress(listAddress[index]);
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
                        context.router.push(AddAddressPage());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPaddingWidthWidget,
                                vertical: kDefaultPaddingHeightScreen)
                            .copyWith(right: kDefaultPaddingWidthScreen),
                        color: Colors.transparent,
                        child: Text(
                          'Chỉnh sửa',
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
