import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';
import 'package:shipf/ui/screen/main/order/widget/order_address_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/order_app_bar_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/order_fee_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/order_parcel_widget.dart';
import 'package:shipf/ui/shared/utils/functions.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final GlobalKey<FormState> addressformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> parcelformKey = GlobalKey<FormState>();

  late OrderCubit orderCubit;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..init(),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          // if (!state.isLoading) {
          //   isLoading == true ? context.router.pop() : null;
          //   isLoading = false;
          // }
          // if (state.isLoading) {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     loadingShowDialog(context);
          //     isLoading = true;
          //   });
          // }
          orderCubit = context.read<OrderCubit>();
          final stepWidget = state.stepOrderType == StepOrderType.address
              ? Form(
                  key: addressformKey,
                  child: OrderAddressWidget(
                    orderCubit: orderCubit,
                    addressFormKey: addressformKey,
                  ),
                )
              : state.stepOrderType == StepOrderType.parcel
                  ? Form(
                      key: parcelformKey,
                      child: OrderParcelWidget(
                        orderCubit: orderCubit,
                        parcelformKey: parcelformKey,
                      ),
                    )
                  : OrderFeeWidget(
                      cubit: orderCubit,
                      orderState: state,
                    );

          return GestureDetector(
            onTap: () {
              unfocus(context);
            },
            child: Scaffold(
              appBar: orderAppBar(context,
                  orderCubit: orderCubit,
                  orderState: state,
                  addressformKey: addressformKey,
                  parcelformKey: parcelformKey),
              body: SafeArea(
                child: state.isFirstLoad ? const SizedBox() : stepWidget,
              ),
            ),
          );
        },
      ),
    );
  }
}
