part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

@immutable
class HomeLoaded extends HomeState {
  HomeLoaded(this.users);
  var users;
}
