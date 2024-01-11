import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_list/cubit/order_list_state.dart';

class OrderListCubit extends Cubit<OrderListState> {
  OrderListCubit() : super(OrderListState.initial());
}
