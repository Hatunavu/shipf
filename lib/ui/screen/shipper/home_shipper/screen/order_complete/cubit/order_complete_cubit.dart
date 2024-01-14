import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/order_complete/cubit/order_complete_state.dart';

class OrderCompleteCubit extends Cubit<OrderCompleteState> {
  OrderCompleteCubit() : super(OrderCompleteState.initial());
}
