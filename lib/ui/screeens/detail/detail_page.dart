import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/data/models/user_card_model.dart';
import 'package:flutter_demo_bloc/ui/common/user_card.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: UserCard.buildFromModel(
        UserCardModel(
          12,
          '',
          '',
          '',
          'https://robohash.org/indelenitinatus.png?size=300x300&set=set1',
          '',
        ),
      ),
    );
  }
}
