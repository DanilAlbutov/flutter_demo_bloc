import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/ui/common/user_avatar.dart';
import '../../data/models/user_model.dart';

import '../screeens/detail/detail_page.dart';

class UserCard extends StatelessWidget {
  UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              user: user,
            ),
          ),
        );
      },
      child: Card(
        elevation: 3,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Hero(
                  tag: 'avatar${user.id}',
                  child: UserAvatar(
                    url: user.avatarUrl,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    '${user.firstName} ${user.secondName}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Arial Black',
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Text('nickname: '),
                      const SizedBox(
                        height: 6,
                      ),
                      Flexible(
                        child: Text(
                          user.email,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'email: ',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Flexible(
                        child: Text(
                          user.email,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
