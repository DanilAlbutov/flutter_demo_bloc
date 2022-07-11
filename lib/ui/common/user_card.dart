import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/user_card_model.dart';

class UserCard extends StatelessWidget {
  UserCard({
    Key? key,
    required this.firstName,
    required this.secondName,
    required this.userName,
    required this.imageUrl,
  }) : super(key: key);

  String firstName;
  String secondName;
  String userName;
  String imageUrl;

  factory UserCard.buildFromModel(UserCardModel model) => UserCard(
        firstName: model.firstName,
        secondName: model.secondName,
        userName: model.userName,
        imageUrl: model.avatarUrl,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 20,
          ),
          Image.network(imageUrl),
          const SizedBox(
            width: 20,
          ),
          Text(
            userName,
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
