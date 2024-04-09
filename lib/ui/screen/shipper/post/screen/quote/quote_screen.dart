// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/data/model/post/post_response.dart';
import 'package:shipf/ui/screen/main/order/widget/order_label_text_filed_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/create_post/widget/select_tonnage_widget.dart';
import 'package:shipf/ui/screen/shipper/post/screen/quote/cubit/quote_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/screen/quote/cubit/quote_state.dart';
import 'package:shipf/ui/screen/shipper/post/widget/post_info.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/textfield/primary_textfield.dart';
import 'package:shipf/ui/shared/utils/functions.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/shared/widget/space/vertical_space.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

class QuoteScreen extends StatelessWidget {
  final PostData postData;
  QuoteScreen({Key? key, required this.postData}) : super(key: key);
  late QuoteCubit quoteCubit;
  final GlobalKey<FormState> quoteFormKey = GlobalKey<FormState>();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteCubit()..init(),
      child: BlocConsumer<QuoteCubit, QuoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          quoteCubit = context.read<QuoteCubit>();
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
              title: 'Báo giá',
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              child: state.isFirstLoad
                  ? const SizedBox()
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPaddingWidthScreen,
                                    vertical: kDefaultPaddingWidthScreen),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                                child: Form(
                                  key: quoteFormKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PostInfo(
                                        postData: postData,
                                      ),
                                      VerticalSpace(
                                          kDefaultPaddingHeightScreen),
                                      const Divider(),
                                      VerticalSpace(
                                          kDefaultPaddingHeightScreen),
                                      Text(
                                        'Thông tin báo giá tới chủ hàng',
                                        style: textHeading,
                                      ),
                                      VerticalSpace(
                                          kDefaultPaddingHeightScreen),
                                      const OrderLabelTextFieldWidget(
                                          label: 'Loại xe'),
                                      SelectTonnageWidget(
                                        tonnage: state.tonnage,
                                        selectTonnage: (tonnage) {
                                          quoteCubit.updateTonnage(tonnage);
                                        },
                                        errorText:
                                            quoteCubit.state.errorTonnage,
                                        validator: (_) {
                                          if (quoteCubit.state.tonnage ==
                                              null) {
                                            quoteCubit.updateTonnageError();
                                          }
                                          return null;
                                        },
                                      ),
                                      VerticalSpace(
                                          kDefaultPaddingHeightScreen),
                                      const OrderLabelTextFieldWidget(
                                          label: 'Giá (VNĐ)'),
                                      PrimaryTextField(
                                        label: '',
                                        controller: state.priceController!,
                                        hintText: '0',
                                        isPrice: true,
                                        isNumberKey: true,
                                        fieldRequire: 'giá',
                                      ),
                                      VerticalSpace(
                                          kDefaultPaddingHeightScreen),
                                      const OrderLabelTextFieldWidget(
                                          label: 'Ghi chú'),
                                      PrimaryTextField(
                                        label: '',
                                        controller: state.noteController!,
                                        hintText: '',
                                        maxLines: 3,
                                        isValidate: false,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPaddingWidthScreen,
                              vertical: kDefaultPaddingHeightScreen),
                          child: PrimaryButton(
                            label: 'Báo giá',
                            onPressed: () async {
                              if (quoteFormKey.currentState!.validate() &&
                                  state.tonnage != null) {
                                final bool success =
                                    await quoteCubit.quote(postId: postData.id);
                                success ? context.router.pop() : null;
                              }
                            },
                          ),
                        )
                      ],
                    ));
        },
      ),
    );
  }
}
