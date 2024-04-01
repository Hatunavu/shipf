// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/cubit/transits_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/cubit/transits_state.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/widget/transit_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class TransitsScreen extends StatelessWidget {
  final LoadingType type;
  TransitsScreen({Key? key, this.type = LoadingType.pickup}) : super(key: key);

  late TransitsCubit transitsCubit;
  bool isUpdating = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransitsCubit()..getTransits(type),
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
                                  'Không có chuyến',
                                  style: textHeading.copyWith(
                                      color: darkTitleColor),
                                ),
                              ],
                            ))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.listTransitData.length,
                            itemBuilder: (context, index) {
                              return TransitItem(
                                cancelTransit: () => transitsCubit
                                    .cancelTransit(
                                        transitId:
                                            state.listTransitData[index].id)
                                    .then((value) =>
                                        transitsCubit.getTransits(type)),
                                acceptTransit: () async {
                                  // final bool success =
                                  await transitsCubit.acceptTransit(
                                      transitId:
                                          state.listTransitData[index].id);
                                  // success
                                  //     ? context.router.replace(ShipmentsPage())
                                  //     : null;
                                },
                                transit: state.listTransitData[index],
                              );
                            }),
              ));
        },
      ),
    );
  }
}
