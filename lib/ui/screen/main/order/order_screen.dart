import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/address/address_screen.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
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
      child: Column(
        children: [
          address(),
        ],
      ),
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
