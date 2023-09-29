import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:socialme/src/features/posts/presentation/edit_post_page.dart';

AppBar buildPostPageAppBar({
  String? title,
  required BuildContext context,
  required bool isAuthor,
}) {
  return AppBar(
    title: Text(
      title ?? AppLocalizations.of(context)!.defaultPostTitle,
    ),
    actions: [
      if (isAuthor)
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(EditPostPage.routeName),
          style: TextButton.styleFrom(foregroundColor: Colors.white),
          child: Text(
            AppLocalizations.of(context)!.editButtonLabel,
          ),
        ),
    ],
  );
}
