import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/cubit/transits_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/cubit/transits_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/widget/transit_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/theme/text_style.dart';

class TransitsScreen extends StatefulWidget {
  final LoadingType type;
  const TransitsScreen({Key? key, this.type = LoadingType.pickup})
      : super(key: key);

  @override
  State<TransitsScreen> createState() => _TransitsScreenState();
}

class _TransitsScreenState extends State<TransitsScreen> {
  late TransitsCubit transitsCubit;
  bool isUpdating = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransitsCubit()..getTransits(widget.type),
      child: BlocConsumer<TransitsCubit, TransitsState>(
        listener: (context, state) {
          if (!state.isUpdating) {
            isUpdating == true ? context.router.pop() : null;
            isUpdating = false;
          }
          if (state.isUpdating) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loadingShowDialog(context);
              isUpdating = true;
            });
          }
        },
        builder: (context, state) {
          transitsCubit = context.read<TransitsCubit>();
          return BaseScreen(
              title: 'Danh sách chuyến',
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
                    : state.listTransitData.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(top: 0.3.sh),
                            child: Center(
                                child: Text(
                              'Không có chuyến',
                              style: textHeading,
                            )))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.listTransitData.length,
                            itemBuilder: (context, index) {
                              return TransitItem(
                                cancelTransit: () =>
                                    transitsCubit.cancelTransit(
                                        transitId:
                                            state.listTransitData[index].id),
                                acceptTransit: () =>
                                    transitsCubit.acceptTransit(
                                        transitId:
                                            state.listTransitData[index].id),
                                transit: state.listTransitData[index],
                              );
                            }),
              ));
        },
      ),
    );
  }
}
