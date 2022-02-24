import 'package:flutter/cupertino.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';

import 'album.dart';

showSliderDialog(BuildContext context) {
  final images =
      NewsDetailsController.get(context).newsDetailsModel.result.postAlbum;

  showCupertinoDialog(
      context: context, builder: (context) => NewsAlbum(images: images));
}
