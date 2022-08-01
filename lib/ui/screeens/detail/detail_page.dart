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
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Hero(
                tag: 'avatar${widget.user.id}',
                child: UserAvatar(
                  url: widget.user.avatarUrl,
                  height: 300,
                  weight: 300,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 10,
              margin: const EdgeInsets.all(10),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: "First name: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: widget.user.firstName,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: "Second name: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: widget.user.secondName,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: "Email: ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                      text: widget.user.email,
                      style: const TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
