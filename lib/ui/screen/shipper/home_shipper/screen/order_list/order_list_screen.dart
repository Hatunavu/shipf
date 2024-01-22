import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/cubit/order_list_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/cubit/order_list_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/theme/constant.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderListCubit()..getShipments(),
      child: BlocConsumer<OrderListCubit, OrderListState>(
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
                child: state.listOrder.isEmpty
                    ? const OrderShimmer()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        padding: EdgeInsets.only(
                            bottom: kDefaultPaddingHeightScreen),
                        itemBuilder: (context, index) {
                          return const OrderItem(
                            shipmentStatus: ShipmentStatus.delivering,
                          );
                        }),
              ));
        },
      ),
    );
  }
}
