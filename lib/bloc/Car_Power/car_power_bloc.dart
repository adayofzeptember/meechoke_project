import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_power_event.dart';
part 'car_power_state.dart';

class CarPowerBloc extends Bloc<CarPowerEvent, CarPowerState> {
  CarPowerBloc()
      : super(CarPowerState(
            car_group_name: '',
            car_group_selectedButtonIndex: -1,
            car_type_selectedButtonIndex: -1)) {
    on<CarGroup_OnButtonPressedIndex>((event, emit) {
      if (state.car_group_selectedButtonIndex == event.getIndex) {
        emit(state.copyWith(
            car_group_selectedButtonIndex: -1,
            car_type_selectedButtonIndex: -1, car_group_name: ''));
      } else {
        emit(state.copyWith(car_group_selectedButtonIndex: event.getIndex));
        if (state.car_group_selectedButtonIndex == 0) {
          emit(state.copyWith(car_group_name: '4 ล้อพ่วง'));
        } else if (state.car_group_selectedButtonIndex == 1) {
          emit(state.copyWith(car_group_name: '6 ล้อ'));
        } else if (state.car_group_selectedButtonIndex == 2) {
          emit(state.copyWith(car_group_name: '10 ล้อ'));
        } else if (state.car_group_selectedButtonIndex == 3) {
          emit(state.copyWith(car_group_name: 'พ่วง'));
        } else if (state.car_group_selectedButtonIndex == 4) {
          emit(state.copyWith(car_group_name: 'เทรลเลอร์'));
        } else if (state.car_group_selectedButtonIndex == 5) {
          emit(state.copyWith(car_group_name: 'ลากตู้'));
        } else {
          emit(state.copyWith(car_group_name: ''));
        }
      }
      print('car group: ' + state.car_group_selectedButtonIndex.toString());
    });

    on<CarType_OnButtonPressedIndex>((event, emit) {
      if (state.car_type_selectedButtonIndex == event.getIndex) {
        emit(state.copyWith(car_type_selectedButtonIndex: -1));
      } else {
        emit(state.copyWith(car_type_selectedButtonIndex: event.getIndex));
      }
      print('car type: ' + state.car_type_selectedButtonIndex.toString());
    });
  }
}
