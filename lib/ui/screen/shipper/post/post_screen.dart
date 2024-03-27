// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shipf/enums/enum_role.dart';
import 'package:shipf/foundation/app_path.dart';
import 'package:shipf/ui/app_cubit.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/widget/order_shimmer.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/cubit/post_state.dart';
import 'package:shipf/ui/screen/shipper/post/widget/post_item.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/image_creator.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);

  late PostCubit postCubit;

  @override
  Widget build(BuildContext context) {
    RoleType? role = context.read<AppCubit>().state.role;

    return BlocProvider(
      create: (context) => PostCubit()..getPosts(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {},
        builder: (context, state) {
          postCubit = context.read<PostCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: role != RoleType.customer
                ? FloatingActionButton(
                    elevation: 0,
                    backgroundColor: primaryColor,
                    child: const Icon(Icons.filter_alt_outlined),
                    onPressed: () => context.router.push(SearchPostPage(
                          tonnage: state.tonnageSearch,
                          provinces: state.provincesSearch,
                          provincesDelivery: state.provincesDeliverySearch,
                          callBack: ({provinces, provincesDelivery, tonnage}) {
                            postCubit.getPosts(
                                provinces: provinces ?? [],
                                provincesDelivery: provincesDelivery ?? [],
                                tonnage: tonnage);
                          },
                        )))
                : SpeedDial(
                    elevation: 0,
                    backgroundColor: primaryColor,
                    activeIcon: Icons.close,
                    children: [
                      SpeedDialChild(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          label: 'Tìm xe',
                          labelBackgroundColor: primaryColor,
                          labelStyle: primarySubTitleStyle.copyWith(
                              color: Colors.white),
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {
                            context.router.push(CreatePostPage(
                              callBack: () {
                                postCubit.getPosts();
                              },
                            ));
                          }),
                      SpeedDialChild(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          label: 'Lọc đơn',
                          labelBackgroundColor: primaryColor,
                          labelStyle: primarySubTitleStyle.copyWith(
                              color: Colors.white),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                          onTap: () {
                            context.router.push(SearchPostPage(
                              tonnage: state.tonnageSearch,
                              provinces: state.provincesSearch,
                              provincesDelivery: state.provincesDeliverySearch,
                              callBack: (
                                  {provinces, provincesDelivery, tonnage}) {
                                postCubit.getPosts(
                                    provinces: provinces ?? [],
                                    provincesDelivery: provincesDelivery ?? [],
                                    tonnage: tonnage);
                              },
                            ));
                          }),
                    ],
                    child: const Icon(Icons.add),
                  ),
            body: RefreshIndicator(
              color: primaryColor,
              onRefresh: () => postCubit.getPosts(),
              child: ListView(
                children: [
                  state.isFirstLoad
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.posts.length,
                                    padding: EdgeInsets.symmetric(
                                        vertical: kDefaultPaddingHeightScreen),
                                    itemBuilder: (context, index) {
                                      return PostItem(
                                        postData: state.posts[index],
                                      );
                                    }),
                                Visibility(
                                  visible: !state.hasReachedEnd,
                                  child: state.isLoading
                                      ? SizedBox(
                                          height: 30.w,
                                          width: 30.w,
                                          child:
                                              const CircularProgressIndicator(
                                            color: primaryColor,
                                          ),
                                        )
                                      : PrimaryButton(
                                          label: 'Xem thêm',
                                          maxWidth: 0.3.sw,
                                          onPressed: () {
                                            postCubit.seeMorePosts();
                                          },
                                        ),
                                ),
                                VerticalSpace(kDefaultPaddingHeightScreen)
                              ],
                            ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
