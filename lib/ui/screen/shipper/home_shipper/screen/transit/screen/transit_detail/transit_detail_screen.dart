import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class TransitDetailScreen extends StatefulWidget {
  final LoadingType type;
  const TransitDetailScreen({Key? key, this.type = LoadingType.pickup})
      : super(key: key);

  @override
  State<TransitDetailScreen> createState() => _TransitDetailScreenState();
}

class _TransitDetailScreenState extends State<TransitDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransitDetailCubit(),
      child: BlocConsumer<TransitDetailCubit, TransitDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BaseScreen(
              title: 'Chi tiết chuyến',
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
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return OrderItem();
                        }),
              ));
        },
      ),
    );
  }
}
