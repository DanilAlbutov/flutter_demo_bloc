import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_bloc.dart';
import 'package:flutter_demo_bloc/ui/common/user_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeLoaded) {
              if (state.users != null) {
                return UsersList(users: state.users);
              } else {
                return const Center(
                  child: Text('Ошибка при загрузке данных.'),
                );
              }
            } else if (state is HomeInitial) {
              return Center(
                child: FloatingActionButton(
                  onPressed: (() =>
                      context.read<HomeBloc>().add(GetDataEvent())),
                ),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }
}
