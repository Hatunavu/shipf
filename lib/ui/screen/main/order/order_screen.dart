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
  final GlobalKey<FormState> addressformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> parcelformKey = GlobalKey<FormState>();
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController senderPhoneController = TextEditingController();
  final TextEditingController senderAddressController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController receiverAddressController =
      TextEditingController();
  final TextEditingController parcelNameController = TextEditingController();
  final TextEditingController parcelPriceController = TextEditingController();
  final TextEditingController parcelAmountController =
      TextEditingController(text: '1');
  final TextEditingController parcelWeightController =
      TextEditingController(text: '1');
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController codController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  late OrderCubit orderCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddAddressCubit()),
        BlocProvider(
            create: (context) => OrderCubit()
              ..init()
              ..getProvinces())
      ],
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          orderCubit = context.read<OrderCubit>();
          final stepWidget = state.stepOrderType == StepOrderType.address
              ? Form(
                  key: addressformKey,
                  child: OrderAddressWidget(
                    orderCubit: orderCubit,
                    senderNameController: senderNameController,
                    senderPhoneController: senderPhoneController,
                    senderAddressController: senderAddressController,
                    receiverNameController: receiverNameController,
                    receiverPhoneController: receiverPhoneController,
                    receiverAddressController: receiverAddressController,
                    addressFormKey: addressformKey,
                  ),
                )
              : state.stepOrderType == StepOrderType.parcel
                  ? Form(
                      key: parcelformKey,
                      child: OrderParcelWidget(
                        orderCubit: orderCubit,
                        parcelNameController: parcelNameController,
                        parcelPriceController: parcelPriceController,
                        parcelWeightController: parcelWeightController,
                        parcelAmountController: parcelAmountController,
                        lengthController: lengthController,
                        widthController: widthController,
                        heightController: heightController,
                        codController: codController,
                        noteController: noteController,
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
                child: SingleChildScrollView(child: stepWidget),
              ),
            ),
          );
        },
      ),
    );
  }
}
