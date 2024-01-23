import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/transit/screen/transit_detail/transit_detail_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class TransitDetailScreen extends StatelessWidget {
  final int transitId;
  const TransitDetailScreen({Key? key, this.transitId = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransitDetailCubit()..getTransitDetail(transitId: transitId),
      child: BlocConsumer<TransitDetailCubit, TransitDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BaseScreen(
              title: 'Chi tiết chuyến',
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              child: SizedBox());
        },
      ),
    );
  }
}
