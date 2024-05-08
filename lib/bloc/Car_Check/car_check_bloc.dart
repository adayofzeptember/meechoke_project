import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_check_event.dart';
part 'car_check_state.dart';

class CarCheckBloc extends Bloc<CarCheckEvent, CarCheckState> {
  CarCheckBloc() : super(CarCheckState()) {
    on<CarCheckEvent>((event, emit) {
      
    });
  }
}
