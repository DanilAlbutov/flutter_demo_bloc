import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  UserAvatar(
      {Key? key, required this.url, this.height = 100, this.weight = 100})
      : super(key: key);

  String url;
  double height;
  double weight;
  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
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
        height: widget.height,
        width: widget.weight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
