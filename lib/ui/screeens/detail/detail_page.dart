import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/data/models/user_model.dart';
import 'package:flutter_demo_bloc/ui/common/user_avatar.dart';
import 'package:flutter_demo_bloc/ui/common/user_card.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.user.userName)),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: 'avatar${widget.user.id}',
              child: UserAvatar(
                url: widget.user.avatarUrl,
                height: 300,
                weight: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
