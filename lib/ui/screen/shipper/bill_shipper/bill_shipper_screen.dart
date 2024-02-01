import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/cubit/bill_shipper_cubit.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/cubit/bill_shipper_state.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/widget/bill_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class BillShipperScreen extends StatefulWidget {
  const BillShipperScreen({Key? key}) : super(key: key);

  @override
  State<BillShipperScreen> createState() => _BillShipperScreenState();
}

class _BillShipperScreenState extends State<BillShipperScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillShipperCubit()..getShipments(),
      child: BlocConsumer<BillShipperCubit, BillShipperState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BaseScreen(
            child: SingleChildScrollView(
              child: state.isFirstLoad
                  ? const OrderShimmer()
                  : state.listOrder.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: 0.2.sh),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(),
                              SizedBox(
                                  height: 0.2.sw,
                                  width: 0.2.sw,
                                  child: ImageCreator.assetImage(
                                      imagePath: AppPath.pick,
                                      color: darkTitleColor)),
                              VerticalSpace(kDefaultPaddingHeightScreen),
                              Text(
                                'Không có đơn',
                                style:
                                    textHeading.copyWith(color: darkTitleColor),
                              ),
                            ],
                          ))
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.listOrder.length,
                          padding: EdgeInsets.only(
                              bottom: kDefaultPaddingHeightScreen),
                          itemBuilder: (context, index) {
                            return BillItem(
                              shipment: state.listOrder[index],
                            );
                          }),
            ),
          );
        },
      ),
    );
  }

  // Widget billList() {
  //   return ListView.separated(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return GestureDetector(
  //             behavior: HitTestBehavior.translucent,
  //             onTap: () {},
  //             child: billItem());
  //       },
  //       separatorBuilder: (context, index) {
  //         return VerticalSpace(
  //           kDefaultPaddingHeightScreen,
  //           color: backgroundColor,
  //         );
  //       },
  //       itemCount: 5);
  // }

  // Widget billItem() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //             vertical: kDefaultPaddingHeightScreen,
  //             horizontal: kDefaultPaddingWidthScreen)
  //         .copyWith(right: 0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Expanded(
  //                 child: Row(
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(right: kDefaultPaddingWidthWidget),
  //                   child: richtextWidget(text1: 'STT: ', text2: '1'),
  //                 ),
  //                 richtextWidget(text1: 'Số bill: ', text2: 'SON84389'),
  //               ],
  //             )),
  //             Text(
  //               'Phân công phát',
  //               style: textBody.copyWith(
  //                   color: Colors.blueAccent, fontStyle: FontStyle.italic),
  //             ),
  //             HorizontalSpace(kDefaultPaddingWidthScreen)
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //                 child: Text(
  //               'SĐT: 0987654321',
  //               style: textBody.copyWith(
  //                   color: primaryColor, fontWeight: FontWeight.w600),
  //             )),
  //             IconButton(
  //               padding: EdgeInsets.symmetric(
  //                   vertical: kDefaultPaddingHeightScreen / 2,
  //                   horizontal: kDefaultPaddingWidthScreen),
  //               constraints: const BoxConstraints(),
  //               icon: const Icon(
  //                 Icons.settings_outlined,
  //                 color: primaryColor,
  //               ),
  //               onPressed: () {
  //                 ToastUtils.showNeutral('Tính năng đăng được phát triển');
  //               },
  //             )
  //           ],
  //         ),
  //         richtextWidget(text1: 'Thời gian: ', text2: '15/12/2023'),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Padding(
  //                 padding:
  //                     EdgeInsets.only(top: kDefaultPaddingHeightScreen / 2),
  //                 child: Text(
  //                   'Đ/c: 9 Phạm Văn Đồng, Mai Dịch, Cầu Giấy, Hà Nội ',
  //                   style: textBody.copyWith(
  //                     color: Colors.black,
  //                   ),
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //             ),
  //             IconButton(
  //               padding: EdgeInsets.symmetric(
  //                   vertical: kDefaultPaddingHeightScreen / 2,
  //                   horizontal: kDefaultPaddingWidthScreen),
  //               constraints: const BoxConstraints(),
  //               icon: const Icon(
  //                 Icons.info_outline,
  //                 color: primaryColor,
  //               ),
  //               onPressed: () {
  //                 ToastUtils.showNeutral('Tính năng đăng được phát triển');
  //               },
  //             )
  //           ],
  //         ),
  //         VerticalSpace(kDefaultPaddingHeightScreen / 2),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: richtextWidget(
  //                   text1: 'Tiền COD: ', text2: '100.000', color: Colors.red),
  //             ),
  //             Expanded(
  //               child: richtextWidget(
  //                   text1: 'Cức phát: ', text2: '20.000', color: Colors.red),
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget richtextWidget(
  //     {String text1 = '', String text2 = '', Color color = Colors.black}) {
  //   return RichText(
  //       text: TextSpan(children: [
  //     TextSpan(text: text1, style: textBody),
  //     TextSpan(
  //         text: text2,
  //         style: textBody.copyWith(color: color, fontWeight: FontWeight.w600))
  //   ]));
  // }
}
