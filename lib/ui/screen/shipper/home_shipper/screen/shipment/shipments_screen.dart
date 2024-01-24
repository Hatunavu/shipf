import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/cubit/shipments_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/shipment/widget/shipment_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/theme/constant.dart';

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
                child: state.shipments.isEmpty
                    ? const OrderShimmer()
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
