import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/screen/shipper/bill_shipper/widget/bill_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late PostCubit postCubit;
    return BlocProvider(
      create: (context) => PostCubit()..getGoods(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          postCubit = context.read<PostCubit>();
          return BaseScreen(
            child: SingleChildScrollView(
              child: state.isFirstLoad
                  ? const OrderShimmer()
                  : state.goods.isEmpty
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
                                'Không có đơn',
                                style:
                                    textHeading.copyWith(color: darkTitleColor),
                              ),
                            ],
                          ))
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.goods.length,
                          padding: EdgeInsets.only(
                              bottom: kDefaultPaddingHeightScreen),
                          itemBuilder: (context, index) {
                            return BillItem(
                              shipment: state.goods[index],
                            );
                          }),
            ),
          );
        },
      ),
    );
  }
}
