import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_cubit.dart';
import 'package:shipf/ui/screen/shipper/post/screen/search_post/cubit/search_post_state.dart';
import 'package:shipf/ui/shared/base_screen.dart';
import 'package:shipf/ui/shared/widget/button/primary_button.dart';
import 'package:shipf/ui/theme/constant.dart';

class SearchPostScreen extends StatelessWidget {
  const SearchPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchPostCubit(),
      child: BlocConsumer<SearchPostCubit, SearchPostState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                  Expanded(child: Text('d')),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: kDefaultPaddingWidthScreen,
                        vertical: kDefaultPaddingHeightScreen),
                    child: Column(
                      children: [
                        PrimaryButton(
                          label: 'Lọc đơn',
                          onPressed: () async {},
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
}
