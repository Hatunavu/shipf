import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/widget/shipment_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class ShipmentsScreen extends StatefulWidget {
  final ShipmentStatus shipmentStatus;
  const ShipmentsScreen(
      {Key? key, this.shipmentStatus = ShipmentStatus.pickingUp})
      : super(key: key);

  @override
  State<ShipmentsScreen> createState() => _ShipmentsScreenState();
}

class _ShipmentsScreenState extends State<ShipmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentsCubit()..getShipments(),
      child: BlocConsumer<ShipmentsCubit, ShipmentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BaseScreen(
              title: 'Danh sách đơn hàng',
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
                child: state.isLoading
                    ? const OrderShimmer()
                    : state.shipments.isEmpty
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
                                  style: textHeading.copyWith(
                                      color: darkTitleColor),
                                ),
                              ],
                            ))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.shipments.length,
                            padding: EdgeInsets.only(
                                bottom: kDefaultPaddingHeightScreen),
                            itemBuilder: (context, index) {
                              return ShipmentItem(
                                shipment: state.shipments[index],
                              );
                            }),
              ));
        },
      ),
    );
  }
}
