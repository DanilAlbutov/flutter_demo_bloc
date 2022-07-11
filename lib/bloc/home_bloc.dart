import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_demo_bloc/data/models/user_card_model.dart';
import 'package:flutter_demo_bloc/data/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeRepository = HomeRepo(
    Dio()
      ..interceptors.add(PrettyDioLogger(
        responseBody: true,
        request: true,
      )),
  );

  HomeBloc() : super(HomeInitial()) {
    on<GetDataEvent>((event, emit) => getData());
  }

  Future<void> getData() async {
    emit(HomeLoading());
    var users = await homeRepository.getUsers(userCount: 20);
    emit(HomeLoaded(users));
  }
}
