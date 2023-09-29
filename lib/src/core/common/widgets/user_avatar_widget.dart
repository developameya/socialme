import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';

///A circular image with a placeholder.
class UserAvatarWidget extends StatelessWidget {
  ///The network url of the image.
  ///
  final String? userImageUrl;

  ///Creates an avatar with the given image in the url.
  ///if [userImageUrl] is null, then provides a placeholder.
  ///
  const UserAvatarWidget({
    super.key,
    this.userImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GFAvatar(
      backgroundImage: userImageUrl != null
          ? CachedNetworkImageProvider(userImageUrl!)
          : null,
      child: userImageUrl == null ? const Icon(Icons.person) : null,
    );
  }
}
