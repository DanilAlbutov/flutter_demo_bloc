import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/home_bloc/home_bloc.dart';

import '../../data/models/user_card_model.dart';
import '../detail/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

@immutable
class UserCard extends StatelessWidget {
  UserCard({
    Key? key,
    required this.firstName,
    required this.secondName,
    required this.userName,
    required this.imageUrl,
    required this.email,
  }) : super(key: key);

  String firstName;
  String secondName;
  String userName;
  String imageUrl;
  String email;
  factory UserCard.buildFromModel(UserCardModel model) => UserCard(
        firstName: model.firstName,
        secondName: model.secondName,
        userName: model.userName,
        imageUrl: model.avatarUrl,
        email: model.email,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: HomeBloc(),
              child: DetailPage(),
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
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 6,
                      value: downloadProgress.progress,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    '$firstName $secondName',
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
                      Text('nickname: '),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(userName),
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
                          email,
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
