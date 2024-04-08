// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipf/data/model/statistic/statistic.dart';
import 'package:shipf/enums/enum_loading_type.dart';
import 'package:shipf/enums/enum_shipment_status.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/injection.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/cubit/home_shipper_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/cubit/home_shipper_state.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class HomeShipperScreen extends StatelessWidget {
  HomeShipperScreen({Key? key}) : super(key: key);

  late HomeShipperCubit homeShipperCubit;
  late List<HomeAction> actions;
  @override
  Widget build(BuildContext context) {
    actions = [
      HomeAction(
          content: 'Chuyển lấy',
          icon: AppPath.pick,
          onTap: () {
            getIt<AppRouter>()
                .push(TransitsPage(type: LoadingType.pickup))
                .then((value) => homeShipperCubit.getData());
          }),
      HomeAction(
          content: 'Chuyến giao',
          icon: AppPath.deliver,
          onTap: () {
            getIt<AppRouter>()
                .push(TransitsPage(type: LoadingType.delivery))
                .then((value) => homeShipperCubit.getData());
          }),
      HomeAction(
          content: 'Trung chuyển',
          icon: AppPath.transshipment,
          onTap: () {
            getIt<AppRouter>()
                .push(TransitsPage(type: LoadingType.transit))
                .then((value) => homeShipperCubit.getData());
          }),
      HomeAction(
          content: 'Đơn lấy',
          icon: AppPath.application,
          onTap: () {
            getIt<AppRouter>()
                .push(ShipmentsPage(shipmentStatus: ShipmentStatus.pickingUp))
                .then((value) => homeShipperCubit.getData());
          }),
      HomeAction(
          content: 'Đơn giao',
          icon: AppPath.deliverOrder,
          onTap: () {
            // getIt<AppRouter>().push(const OrderListPage());
            getIt<AppRouter>()
                .push(ShipmentsPage(shipmentStatus: ShipmentStatus.delivering))
                .then((value) => homeShipperCubit.getData());
          }),
      // HomeAction(
      //   content: 'Chuyến hoàn',
      //   icon: AppPath.returnTrip,
      //   // onTap: () {
      //   //   getIt<AppRouter>().push(const OrderListPage());
      //   // }
      // ),
      HomeAction(
          content: 'Đơn thất bại',
          icon: AppPath.failed,
          onTap: () {
            // getIt<AppRouter>().push(const OrderCompletePage());
            getIt<AppRouter>()
                .push(
                    ShipmentsPage(shipmentStatus: ShipmentStatus.failDelivery))
                .then((value) => homeShipperCubit.getData());
          }),
      HomeAction(
          content: 'Đơn thành công',
          icon: AppPath.success,
          onTap: () {
            // getIt<AppRouter>().push(const OrderCompletePage());
            getIt<AppRouter>()
                .push(ShipmentsPage(
                    shipmentStatus: ShipmentStatus.successDelivery))
                .then((value) => homeShipperCubit.getData());
          }),
      // HomeAction(content: 'Đối soát', icon: AppPath.transfer),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(NotificationPage());
              },
              icon: const Icon(Ionicons.notifications)),
          IconButton(
              onPressed: () {
                context.router.push(SettingPage());
              },
              icon: const Icon(Ionicons.settings_outline))
        ],
        title: const Text('ShipF'),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => HomeShipperCubit()..init(),
        child: BlocConsumer<HomeShipperCubit, HomeShipperState>(
          listener: (context, state) {},
          builder: (context, state) {
            homeShipperCubit = context.read<HomeShipperCubit>();
            return action(state);
          },
        ),
      ),
    );
  }

  Widget action(HomeShipperState state) {
    return RefreshIndicator(
      color: primaryColor,
      onRefresh: () => homeShipperCubit.init(),
      child: ListView(
        children: [
          GridView.builder(
            physics: const ScrollPhysics(),
            padding: EdgeInsets.only(
                left: kDefaultPaddingWidthScreen,
                top: kDefaultPaddingHeightScreen),
            shrinkWrap: true,
            itemCount: actions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 2 / 3),
            itemBuilder: (BuildContext context, int index) {
              return state.isLoading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.4),
                      highlightColor: Colors.grey.withOpacity(0.1),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: kDefaultPaddingWidthScreen,
                            bottom: kDefaultPaddingHeightScreen),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)),
                      ))
                  : GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: actions[index].onTap ??
                          () {
                            ToastUtils.showNeutral(
                                'Tính năng đăng được phát triển');
                          },
                      child: Container(
                        margin: EdgeInsets.only(
                            right: kDefaultPaddingWidthScreen,
                            bottom: kDefaultPaddingHeightScreen),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)),
                        padding: EdgeInsets.symmetric(
                            vertical: kDefaultPaddingHeightScreen / 2,
                            horizontal: kDefaultPaddingWidthScreen / 2),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 0.15.sw,
                                        width: 0.15.sw,
                                        child: ImageCreator.assetImage(
                                            imagePath: actions[index].icon,
                                            color: Colors.white)),
                                  ],
                                ),
                                Text(
                                  state.analysis[index].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: primaryHeaderTitleStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  actions[index].content,
                                  style: primarySubTitleStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Visibility(
                              visible: state.newElements[index] != 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius)),
                                    child: Text(
                                      state.newElements[index].toString(),
                                      style: primarySubTitleStyle.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
