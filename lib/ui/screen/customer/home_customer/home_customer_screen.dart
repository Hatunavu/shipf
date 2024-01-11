import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shipf/ui/router/router.gr.dart';
import 'package:shipf/ui/screen/customer/home_customer/cubit/home_customer_cubit.dart';
import 'package:shipf/ui/screen/customer/home_customer/cubit/home_customer_state.dart';
import 'package:shipf/ui/screen/main/feed/feed_screen.dart';
import 'package:shipf/ui/theme/constant.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({Key? key}) : super(key: key);

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  late HomeCustomerCubit homeCustomerCubit;
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
        create: (context) => HomeCustomerCubit(),
        child: BlocConsumer<HomeCustomerCubit, HomeCustomerState>(
          listener: (context, state) {},
          builder: (context, state) {
            homeCustomerCubit = context.read<HomeCustomerCubit>();
            return FeedScreen();
          },
        ),
      ),
    );
  }
}
