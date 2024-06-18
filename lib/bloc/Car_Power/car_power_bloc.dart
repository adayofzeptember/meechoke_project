import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_power_event.dart';
part 'car_power_state.dart';

class CarPowerBloc extends Bloc<CarPowerEvent, CarPowerState> {
  CarPowerBloc()
      : super(CarPowerState(
            car_group_selectedButtonIndex: -1,
            car_type_selectedButtonIndex: -1)) {
    on<CarGroup_OnButtonPressedIndex>((event, emit) {
      if (state.car_group_selectedButtonIndex == event.getIndex) {
        emit(state.copyWith(
            car_group_selectedButtonIndex: -1,
            car_type_selectedButtonIndex: -1));
      } else {
        emit(state.copyWith(car_group_selectedButtonIndex: event.getIndex));
      }
      print('car group: '+state.car_group_selectedButtonIndex.toString());
    });

    on<CarType_OnButtonPressedIndex>((event, emit) {
      if (state.car_type_selectedButtonIndex == event.getIndex) {
        emit(state.copyWith(car_type_selectedButtonIndex: -1));
      } else {
        emit(state.copyWith(car_type_selectedButtonIndex: event.getIndex));
        
      }
      print('car type: '+state.car_type_selectedButtonIndex.toString());
    });
  }
}
