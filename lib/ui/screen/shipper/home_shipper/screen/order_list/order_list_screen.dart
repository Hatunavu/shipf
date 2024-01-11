import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/cubit/order_list_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/cubit/order_list_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderListCubit(),
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
              child: Center());
        },
      ),
    );
  }
}
