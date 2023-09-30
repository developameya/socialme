import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

class EditPostPage extends HookWidget {
  const EditPostPage({super.key});

  static const routeName = '/editpost';

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<File?> image = useState(null);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editPostTitle),
        actions: [
          TextButton(
            onPressed: () {
              debugPrint("save post.");
              //TODO: upload the image and get the url.
              //TODO: save the post entity to database.
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: Text(AppLocalizations.of(context)!.saveButtonLabel),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.titleTextHint),
                  textInputAction: TextInputAction.next,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.postBodyHint,
                        border: const OutlineInputBorder()),
                    textInputAction: TextInputAction.newline,
                    autocorrect: false,
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                  ),
                ),
                Text(
                  "${AppLocalizations.of(context)!.imageAttachPrompt}:",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          debugPrint("gallery image pressed.");
                          pickImage(imgSrc: ImageSource.gallery, image: image);
                        },
                        icon: const Icon(Icons.photo),
                        label: Text(
                            AppLocalizations.of(context)!.galleryButtonLabel),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          debugPrint("camera image pressed.");
                          pickImage(imgSrc: ImageSource.camera, image: image);
                        },
                        icon: const Icon(Icons.camera),
                        label: Text(
                            AppLocalizations.of(context)!.cameraButtonLabel),
                      )
                    ]),
                const SizedBox(height: 15),
                image.value != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          image.value!,
                        ))
                    : Text(
                        AppLocalizations.of(context)!.noImageAttachementPrompt),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future pickImage(
    {required ImageSource imgSrc, required ValueNotifier<File?> image}) async {
  try {
    final srcImg = await ImagePicker().pickImage(source: imgSrc);

    if (srcImg == null) return;

    final imageTemp = File(srcImg.path);

    // setState(() => this.image = imageTemp);
    image.value = imageTemp;
  } on PlatformException catch (e) {
    //Call the toast.
    print('Failed to pick image: $e');
  }
}
