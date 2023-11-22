import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/main/add_address/cubit/add_address_cubit.dart';
import 'package:shipf/ui/screen/main/add_address/widget/select_address_widget.dart';
import 'package:shipf/ui/shared/base_screen.dart';

class AddAddressScreen extends StatefulWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAddressCubit()..getLocationProvinces(),
      child: BaseScreen(
        child: Column(
          children: [
            SelectAddressWidget(
              label: 'Tỉnh/Thành phố',
            ),
            SelectAddressWidget(
              label: 'Quận/Huyện',
              isDistrict: true,
            ),
            SelectAddressWidget(
              label: 'Phường/Xã/Thị trấn',
              isWard: true,
            ),
          ],
        ),
      ),
    );
  }
}
