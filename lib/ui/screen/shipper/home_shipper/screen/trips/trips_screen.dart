import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/trips/cubit/trips_cubit.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/trips/cubit/trips_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripsState>(
        listener: (context, state) {},
        builder: (context, state) {
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
              child: Center());
        },
      ),
    );
  }
}
