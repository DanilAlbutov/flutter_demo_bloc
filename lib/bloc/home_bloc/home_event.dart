part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetDataEvent extends HomeEvent {
  final int count;
  const GetDataEvent(this.count);
}

class SetInitialEvent extends HomeEvent {}
