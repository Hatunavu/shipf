import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
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
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController senderController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderAddressController = TextEditingController();
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController receiverAddressController =
      TextEditingController();
  late OrderCubit orderCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AddAddressCubit()..getLocationProvinces()),
        BlocProvider(create: (context) => OrderCubit())
      ],
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          orderCubit = context.read<OrderCubit>();
          final stepWidget = state.stepOrderType == StepOrderType.address
              ? OrderAddressWidget(
                  orderCubit: orderCubit,
                  // senderNameController: senderController,
                  // senderPhoneController: senderPhoneController,
                  // senderAddressController: senderAddressController,
                  // receiverNameController: receiverController,
                  // receiverPhoneController: receiverPhoneController,
                  // receiverAddressController: receiverAddressController,
                  )
              : state.stepOrderType == StepOrderType.parcel
                  ? OrderParcelWidget()
                  : OrderFeeWidget();
          return GestureDetector(
            onTap: () {
              unfocus(context);
            },
            child: Scaffold(
              appBar: OrderAppBar(
                context,
                orderCubit: orderCubit,
                orderState: state,
              ),
              body: SafeArea(
                child: SingleChildScrollView(child: stepWidget),
              ),
            ),
          );
        },
      ),
    );
  }
}
