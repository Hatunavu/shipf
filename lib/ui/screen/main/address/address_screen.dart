import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/ui/screen/main/address/cubit/address_cubit.dart';
import 'package:shipf/ui/screen/main/address/cubit/address_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class AddressScreen extends StatefulWidget {
  final bool isDeliver;
  Function(AddressSavedData address) selectAddress;
  AddressScreen({Key? key, required this.selectAddress, this.isDeliver = false})
      : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit()..getAddresses(widget.isDeliver),
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (!state.isLoading) {
            isLoading == true ? context.router.pop() : null;
            isLoading = false;
          }
          if (state.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loadingShowDialog(context);
              isLoading = true;
            });
          }
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
                  state.addresses.isEmpty
                      ? SizedBox(
                          height: 0.5.sh,
                          child: Center(
                            child: Text(
                              'Chưa có địa chỉ đã lưu',
                              style: textBody,
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.addresses.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  widget.selectAddress(state.addresses[index]);
                                  context.router.pop();
                                },
                                child: itemAddress(state.addresses[index]));
                          })
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemAddress(AddressSavedData address) {
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
                            address.name,
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
