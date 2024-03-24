// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/address/address.dart';
import 'package:shipf/enums/enum_tonnage.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/main/order/widget/select_address_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_tonnage_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';

class SearchPostScreen extends StatelessWidget {
  final TonnageType? tonnage;
  final List<AddressDataModel> provinces;
  final List<AddressDataModel> provincesDelivery;
  final Function(
      {TonnageType? tonnage,
      List<AddressDataModel>? provinces,
      List<AddressDataModel>? provincesDelivery})? callBack;
  SearchPostScreen(
      {Key? key,
      this.callBack,
      this.tonnage,
      this.provinces = const [],
      this.provincesDelivery = const []})
      : super(key: key);
  late SearchPostCubit searchPostCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPostCubit()
        ..init(
            selectedProvinces: provinces,
            selectedProvincesDeliver: provincesDelivery,
            tonnage: tonnage),
      child: BlocConsumer<SearchPostCubit, SearchPostState>(
        listener: (context, state) {},
        builder: (context, state) {
          searchPostCubit = context.read<SearchPostCubit>();
          return BaseScreen(
              title: 'Lọc đơn',
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthWidget,
                        vertical: kDefaultPaddingHeightScreen,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const OrderLabelTextFieldWidget(label: 'Loại xe'),
                          SelectTonnageWidget(
                            tonnage: state.tonnage,
                            selectTonnage: (tonnage) {
                              searchPostCubit.updateTonnage(tonnage: tonnage);
                            },
                          ),
                          VerticalSpace(
                            kDefaultPaddingHeightScreen,
                          ),
                          itemSelectLocation(
                            label: 'Tỉnh/Thành phố bốc hàng',
                          ),
                          VerticalSpace(
                            kDefaultPaddingHeightScreen,
                          ),
                          itemSelectLocation(
                              label: 'Tỉnh/Thành phố trả hàng', isDeliver: true)
                        ],
                      ),
                    ),
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Column(
                      children: [
                        PrimaryButton.outline(
                          label: 'Xoá lọc',
                          onPressed: () {
                            searchPostCubit.updateProvince([]);
                            searchPostCubit
                                .updateProvince([], isDelivery: true);
                            searchPostCubit.updateTonnage();
                          },
                        ),
                        VerticalSpace(kDefaultPaddingHeightScreen),
                        PrimaryButton(
                          label: 'Lọc đơn',
                          onPressed: () {
                            callBack!(
                                provinces: state.selectedProvinces,
                                provincesDelivery:
                                    state.selectedProvincesDeliver,
                                tonnage: state.tonnage);
                            context.router.pop();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget itemSelectLocation({
    required String label,
    bool isDeliver = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderLabelTextFieldWidget(label: label),
        SelectAddressWidget(
          isMultiSelect: true,
          selectDistrict: (index) {},
          selectWard: (index) {},
          label: label,
          isDeliver: isDeliver,
          provinces: searchPostCubit.state.provinces,
          selectProvince: (index) {},
          multiProvince: (provinces) {
            searchPostCubit.updateProvince(provinces, isDelivery: isDeliver);
          },
          multiProvinces: isDeliver
              ? searchPostCubit.state.selectedProvincesDeliver
              : searchPostCubit.state.selectedProvinces,
        ),
      ],
    );
  }
}
