import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
import 'package:shipf/ui/screen/main/add_address/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/main/address/address_screen.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _homeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressCubit()..getLocationProvinces(),
      child: BaseScreen(
        title: 'Tạo đơn hàng',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // address(),
              // Divider(
              //   thickness: kDefaultPaddingHeightScreen,
              //   color: backgroundColor,
              // ),
              address2('Nơi gửi'),
              Divider(
                thickness: kDefaultPaddingHeightScreen,
                color: backgroundColor,
              ),
              address2('Nơi nhận'),
            ],
          ),
        ),
      ),
    );
  }

  Widget address2(String type) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightScreen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: textHeading,
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          labelTextField('Họ và Tên'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: Nguyễn Văn A',
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          labelTextField('Số điện thoại'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: 098xxxxxxx',
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextField('Địa chỉ'),
                    PrimaryTextField(
                      label: '',
                      controller: _homeController,
                      hintText: 'Ví dụ: 123 đường Chiến Thắng,...',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: kDefaultPaddingWidthScreen / 2,
              ),
              Expanded(child: itemSelectLocation(label: 'Tỉnh/Thành phố')),
            ],
          ),
          SizedBox(
            height: kDefaultPaddingHeightScreen / 2,
          ),
          Row(
            children: [
              Expanded(
                  child: itemSelectLocation(
                      label: 'Quận/Huyện', isDistrict: true)),
              SizedBox(
                width: kDefaultPaddingWidthScreen / 2,
              ),
              Expanded(
                  child: itemSelectLocation(
                      label: 'Phường/Xã/Thị trấn', isWard: true)),
            ],
          ),
        ],
      ),
    );
  }

  Widget labelTextField(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget, vertical: 5.h),
      child: Text(
        label,
        style: primarySubTitleStyle,
      ),
    );
  }

  Widget itemSelectLocation(
      {bool isDistrict = false, bool isWard = false, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField(label),
        SelectAddressWidget(
          label: label,
          isDistrict: isDistrict,
          isWard: isWard,
        ),
      ],
    );
  }

  Widget address() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthWidget,
          vertical: kDefaultPaddingHeightWidget),
      padding: EdgeInsets.symmetric(
              horizontal: kDefaultPaddingWidthScreen,
              vertical: kDefaultPaddingHeightScreen)
          .copyWith(right: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Ionicons.locate,
                      color: primaryColor,
                      size: 16.sp,
                    ),
                    Dash(
                      direction: Axis.vertical,
                      length: 40.h,
                      dashLength: kDefaultPaddingHeightScreen / 2,
                      dashColor: Colors.grey,
                      dashThickness: 0.5,
                    ),
                    Icon(
                      Ionicons.location,
                      color: primaryColor,
                      size: 16.sp,
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.router.push(AddressPage());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Địa chỉ gửi hàng',
                                style: textBody.copyWith(color: Colors.black),
                              ),
                              Container(
                                height: 40.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          listAddress[0].fullName,
                                          style: primarySubTitleStyle.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width: kDefaultPaddingWidthScreen,
                                        ),
                                        Text(
                                          listAddress[0].phone,
                                          style: primarySubTitleStyle,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      listAddress[0].fullAddress,
                                      style: primarySubTitleStyle.copyWith(
                                          color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.router.push(AddressPage());
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Địa chỉ nhận hàng',
                                style: textBody.copyWith(color: Colors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    listAddress[1].fullName,
                                    style: primarySubTitleStyle.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: kDefaultPaddingWidthScreen,
                                  ),
                                  Text(
                                    listAddress[1].phone,
                                    style: primarySubTitleStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(listAddress[1].fullAddress,
                                  style: primarySubTitleStyle.copyWith(
                                      color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPaddingHeightWidget,
                  horizontal: kDefaultPaddingWidthScreen),
              child: Icon(
                Icons.swap_vert_outlined,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
