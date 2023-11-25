import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipf/enums/enum_step_order.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_cubit.dart';
import 'package:shipf/ui/screen/main/order/cubit/order_state.dart';
import 'package:shipf/ui/theme/constant.dart';
import 'package:shipf/ui/theme/text_style.dart';

PreferredSizeWidget OrderAppBar(BuildContext context,
    {required OrderState orderState, required OrderCubit orderCubit}) {
  return AppBar(
    titleSpacing: 0,
    automaticallyImplyLeading: false,
    toolbarHeight: 60.h,
    backgroundColor: primaryColor,
    elevation: 0,
    title: Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35.h,
                width: 0.1.sw,
                child: Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.75.sw,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  stepItem(
                      stepOrderType: StepOrderType.address,
                      isActive: true,
                      orderCubit: orderCubit),
                  Expanded(
                    child: Divider(
                      height: 20.h,
                      color: Colors.white,
                    ),
                  ),
                  stepItem(
                      stepOrderType: StepOrderType.goods,
                      isActive:
                          orderState.stepOrderType != StepOrderType.address,
                      orderCubit: orderCubit),
                  Expanded(
                    child: Divider(
                      height: 20.h,
                      color: Colors.white,
                    ),
                  ),
                  stepItem(
                      stepOrderType: StepOrderType.fee,
                      isActive: orderState.stepOrderType == StepOrderType.fee,
                      orderCubit: orderCubit)
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget stepItem(
    {required StepOrderType stepOrderType,
    bool isActive = false,
    required OrderCubit orderCubit}) {
  return GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      orderCubit.updateStepOrder(stepOrderType);
    },
    child: Column(
      children: [
        IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Container(
                height: 20.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                    color: isActive ? Colors.white : primaryColor),
                child: Text(
                  stepOrderType.displayNumber(),
                  style: textBody.copyWith(
                      color: isActive ? primaryColor : Colors.white,
                      fontSize: 10.h),
                ))),
        SizedBox(
          height: 4.h,
        ),
        Text(
          stepOrderType.display(),
          style: primarySubTitleStyle.copyWith(
              color: Colors.white, fontSize: 12.h),
        )
      ],
    ),
  );
}
