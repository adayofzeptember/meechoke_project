// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

sealed class CarCheckEvent extends Equatable {
  const CarCheckEvent();

  @override
  List<Object> get props => [];
}

class Load_CheckList extends CarCheckEvent {}

class Load_CheckList2 extends CarCheckEvent {}

class Count_PlusIndex extends CarCheckEvent {
  String? method;
  Count_PlusIndex({required this.method});
}


class Swap_Index extends CarCheckEvent {
  int? getIndex;
  Swap_Index({required this.getIndex});
}

class TestList extends CarCheckEvent {
  String? getString;
  TestList({required this.getString});
}


class StoreCheck1 extends CarCheckEvent {
  List<CheckupResult_Item>? getCheck1;
  StoreCheck1({required this.getCheck1});
}
