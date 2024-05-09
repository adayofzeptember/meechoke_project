part of 'car_check_bloc.dart';

sealed class CarCheckEvent extends Equatable {
  const CarCheckEvent();

  @override
  List<Object> get props => [];
}

class Load_CheckList extends CarCheckEvent {}

class Load_CheckList2 extends CarCheckEvent {}
