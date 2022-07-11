import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_card_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserCardModel user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.ac_unit,
            size: 60,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            user.userName,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Arial Black',
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
        ],
      ),
    );
  }
}
