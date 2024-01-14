import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_complete/cubit/order_complete_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_complete/cubit/order_complete_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_item.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class OrderCompleteScreen extends StatefulWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  State<OrderCompleteScreen> createState() => _OrderCompleteScreenState();
}

class _OrderCompleteScreenState extends State<OrderCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCompleteCubit(),
      child: BlocConsumer<OrderCompleteCubit, OrderCompleteState>(
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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const OrderItem(
                      shipmentStatus: ShipmentStatus.successDelivery,
                    );
                  }));
        },
      ),
    );
  }
}
