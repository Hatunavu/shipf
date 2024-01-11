import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipf/ui/screen/shipper/home_shipper/screen/trips/cubit/trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(TripsState.initial());
}
