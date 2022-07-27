import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/ui/common/user_card.dart';
import '../../../bloc/home_bloc/home_bloc.dart';

class UsersList extends StatefulWidget {
  const UsersList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                scrollDirection: Axis.vertical,
                itemCount: state.users.length,
                itemBuilder: (context, index) =>
                    UserCard(user: state.users[index]),
              );
            } else if (state is HomeInitial) {
              return const Center(
                child: Text('Initial state'),
              );
            } else {
              return const Center(
                child: Text('Empty'),
              );
            }
          },
        ),
      ),
    );
  }
}
