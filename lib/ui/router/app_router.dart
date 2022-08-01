import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/home_bloc/home_bloc.dart';
import '../screeens/home/home_page.dart';
import '../screeens/list/users_list_page.dart';

class AppRouter {
  final HomeBloc _homeBloc = HomeBloc();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _homeBloc,
            child: const HomePage(
              title: 'Home',
            ),
          ),
        );
      case '/list':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _homeBloc,
            child: const UsersList(
              title: 'Users',
            ),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _homeBloc.close();
  }
}
