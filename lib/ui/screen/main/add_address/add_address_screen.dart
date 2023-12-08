import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class AddAddressScreen extends StatefulWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _homeController = TextEditingController();
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    final sections = _buildContent();
    return BlocProvider(
      create: (context) => AddAddressCubit(),
      child: BaseScreen(
        title: 'Địa chỉ mới',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: kDefaultPaddingHeightScreen,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPaddingWidthWidget),
                            child: sections[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: kDefaultPaddingHeightScreen,
                            ),
                        itemCount: sections.length),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: kDefaultPaddingHeightScreen),
                      margin: EdgeInsets.symmetric(
                          vertical: kDefaultPaddingHeightWidget),
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                        color: borderColor,
                        width: 0.2,
                      ))),
                      child: Text(
                        'Xóa địa chỉ',
                        style: textBody.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPaddingWidthWidget,
                  vertical: kDefaultPaddingHeightScreen),
              child: const PrimaryButton.grey(label: 'Lưu địa chỉ'),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      itemSelectLocation(label: 'Tỉnh/Thành phố'),
      itemSelectLocation(label: 'Quận/Huyện', isDistrict: true),
      itemSelectLocation(label: 'Phường/Xã/Thị trấn', isWard: true),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelTextField('Tên đường, Tòa nhà, Số nhà'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: 123 đường Chiến Thắng,...',
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelTextField('Họ và Tên'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: Nguyễn Văn A',
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelTextField('Số điện thoại'),
          PrimaryTextField(
            label: '',
            controller: _homeController,
            hintText: 'Ví dụ: 098xxxxxxx',
          ),
        ],
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Text(
      //       'Loại địa chỉ',
      //       style: textBody,
      //     ),
      //     SizedBox(
      //       width: 0.5.sw,
      //       child: Row(
      //         children: [
      //           const Expanded(
      //               child: PrimaryButton(
      //             defaultHeight: true,
      //             label: 'Nhà riêng',
      //           )),
      //           SizedBox(
      //             width: kDefaultPaddingWidthScreen,
      //           ),
      //           const Expanded(
      //               child: PrimaryButton.outline(
      //             label: 'Văn phòng',
      //             defaultHeight: true,
      //             borderColor: Colors.grey,
      //             textColor: Colors.grey,
      //           )),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Đặt làm địa chỉ nhận mặc định',
            style: textBody,
          ),
          CupertinoSwitch(
            activeColor: primaryColor,
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Đặt làm địa chỉ gửi mặc định',
            style: textBody,
          ),
          CupertinoSwitch(
            activeColor: primaryColor,
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
        ],
      ),
    ];
  }

  Widget itemSelectLocation(
      {bool isDistrict = false, bool isWard = false, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextField(label),
        // SelectAddressWidget(
        //   label: label,
        //   isDistrict: isDistrict,
        //   isWard: isWard,
        // ),
      ],
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
}
