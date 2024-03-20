// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/cubit/user_post_cubit.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/cubit/user_post_state.dart';
import 'package:shipf/ui/screen/main/setting/screen/user_post/widget/user_post_item.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/shared/widget/toast_util.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class UserPostScreen extends StatelessWidget {
  UserPostScreen({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPostCubit()..getPostSaved(),
      child: BlocConsumer<UserPostCubit, UserPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (!state.isLoading) {
            isLoading == true ? context.router.pop() : null;
            isLoading = false;
          }
          if (state.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              loadingShowDialog(context);
              isLoading = true;
            });
          }
          return BaseScreen(
              title: 'Tìm xe',
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.router.push(const CreatePostPage());
                },
                elevation: 0,
                backgroundColor: primaryColor,
                child: const Icon(Icons.add),
              ),
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
                child: state.isFirstLoad
                    ? const OrderShimmer()
                    : state.posts.isEmpty
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
                                  style: textHeading.copyWith(
                                      color: darkTitleColor),
                                ),
                              ],
                            ))
                        : Column(
                            children: [
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  padding: EdgeInsets.symmetric(
                                      vertical: kDefaultPaddingHeightScreen),
                                  itemBuilder: (context, index) {
                                    return UserPostItem();
                                  }),
                              PrimaryButton(
                                label: 'Xem thêm',
                                maxWidth: 0.3.sw,
                                onPressed: () {
                                  ToastUtils.showNeutral(
                                      'Tính năng đăng được phát triển');
                                },
                              ),
                              VerticalSpace(kDefaultPaddingHeightScreen)
                            ],
                          ),
              ));
        },
      ),
    );
  }
}
