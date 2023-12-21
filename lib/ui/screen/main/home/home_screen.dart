import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/data/model/statistic/statistic.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

final List<Statistic> statistics = [
  Statistic(content: 'Tổng bill', data: '0', color: '0xff00c3e3'),
  Statistic(content: 'Chờ lấy hàng', data: '0', color: '0xffffd73a'),
  Statistic(content: 'Đơn thất bại', data: '0', color: '0xffff4554'),
  Statistic(content: 'Chuyển hàng', data: '0', color: '0xff00c3e3'),
  Statistic(content: 'Chờ giao hàng', data: '0', color: '0xffffd73a'),
  Statistic(content: 'Chuyển hoàn', data: '0', color: '0xffff4554'),
  Statistic(content: 'Phát thành công', data: '0', color: '0xff00c3e3'),
  Statistic(content: 'Chờ trung chuyển', data: '0', color: '0xffffd73a'),
  Statistic(content: 'Đối soát', data: '0', color: '0xffff4554'),
];

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeAction> actions = [
    HomeAction(content: 'Chuyển lấy', icon: AppPath.pick),
    HomeAction(content: 'Chuyến giao', icon: AppPath.deliver),
    HomeAction(content: 'Trung chuyển', icon: AppPath.transshipment),
    HomeAction(content: 'Đơn lấy', icon: AppPath.application),
    HomeAction(content: 'Đơn giao', icon: AppPath.deliverOrder),
    HomeAction(content: 'Chuyến hoàn', icon: AppPath.returnTrip),
    HomeAction(content: 'Đơn thất bại', icon: AppPath.failed),
    HomeAction(content: 'Đơn thành công', icon: AppPath.success),
    HomeAction(content: 'Đối soát', icon: AppPath.transfer),
  ];
  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Ionicons.notifications)),
          IconButton(
              onPressed: () {
                context.router.push(SettingPage());
              },
              icon: Icon(Ionicons.settings_outline))
        ],
        title: const Text('ShipF'),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [statistic(), action()],
        ),
      ),
    );
  }

  Widget statistic() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPaddingWidthScreen,
          vertical: kDefaultPaddingHeightScreen),
      shrinkWrap: true,
      itemCount: statistics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 2),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // margin: EdgeInsets.only(
          //     right: kDefaultPaddingWidthScreen,
          //     bottom: kDefaultPaddingHeightScreen),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddingWidthScreen),
          decoration: BoxDecoration(
              color: Color(int.parse(statistics[index].color)),
              border: Border.all(color: Colors.white)
              // borderRadius: BorderRadius.circular(defaultBorderRadius)
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                statistics[index].content,
                style: textBottomBar.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                statistics[index].data,
                style: primarySubTitleStyle.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
        );
      },
    );
  }

  Widget action() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
          left: kDefaultPaddingWidthScreen, top: kDefaultPaddingHeightScreen),
      shrinkWrap: true,
      itemCount: actions.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            log('object');
          },
          child: Container(
            margin: EdgeInsets.only(
                right: kDefaultPaddingWidthScreen,
                bottom: kDefaultPaddingHeightScreen),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 0.2.sw,
                    width: 0.2.sw,
                    child: ImageCreator.assetImage(
                        imagePath: actions[index].icon, color: Colors.white)),
                Text(
                  actions[index].content,
                  style: primarySubTitleStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
