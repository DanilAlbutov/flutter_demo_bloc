import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/ui/common/user_card.dart';
import '../../data/models/user_card_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<UserCardModel> users;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        itemBuilder: (context, index) => UserCard.buildFromModel(users[index]),
      ),
    );
  }
}
