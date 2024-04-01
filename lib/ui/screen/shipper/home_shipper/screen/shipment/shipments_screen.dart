import 'package:auto_route/auto_route.dart';
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
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class ShipmentsScreen extends StatelessWidget {
  final ShipmentStatus shipmentStatus;
  const ShipmentsScreen(
      {Key? key, this.shipmentStatus = ShipmentStatus.pickingUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    ShipmentsCubit shipmentsCubit;
    return BlocProvider(
      create: (context) =>
          ShipmentsCubit()..getShipments(shipmentStatus: shipmentStatus),
      child: BlocConsumer<ShipmentsCubit, ShipmentsState>(
        listener: (context, state) {
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
        },
        builder: (context, state) {
          shipmentsCubit = context.read<ShipmentsCubit>();
          return BaseScreen(
              title: 'Danh sách đơn hàng',
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context, true);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              child: SingleChildScrollView(
                child: state.isFirstLoad
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
                                shipmentsCubit: shipmentsCubit,
                                shipmentStatus: shipmentStatus,
                                shipment: state.shipments[index],
                              );
                            }),
              ));
        },
      ),
    );
  }
}
