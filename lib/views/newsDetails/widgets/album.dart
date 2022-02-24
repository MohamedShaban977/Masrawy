import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masrawy/constants.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:masrawy/views/newsDetails/models/news_details.dart';

// class NewsDetailsAlbum extends StatelessWidget {
//   final List<PostAlbum> images;
//
//   const NewsDetailsAlbum({Key key, this.images}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return images == null || images.isEmpty
//         ? Text('')
//         : SizedBox(
//             height: sizeFromHeight(2),
//             child: Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.transparent,
//                 elevation: 0,
//                 leading: IconButton(
//                   icon: Icon(
//                     Icons.highlight_remove_rounded,
//                     size: 40,
//                   ),
//                   onPressed: MagicRouter.pop,
//                 ),
//               ),
//               backgroundColor: Colors.black87.withOpacity(0.7),
//               body: Center(
//                 child: Container(
//                   height: 500,
//                   child: PageView(
//                     controller:
//                         PageController(viewportFraction: 0.9, keepPage: true),
//                     children: images[0]
//                         .albumImages
//                         .map((e) => Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 5),
//                               child: _animatedLoadNetworkImage(e.imageUrl),
//                             ))
//                         .toList(),
//                   ),
//                 ),
//               ),
//             ),
//           );
//   }
//
//
// }

Widget NewsAlbum({List<PostAlbum> images}) {
  return images == null || images.isEmpty
      ? Text('')
      : Container(
          height: 500,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: PageView(
            controller: PageController(viewportFraction: 0.9, keepPage: true),
            children: images[0]
                .albumImages
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: _animatedLoadNetworkImage(e.imageUrl),
                    ))
                .toList(),
          ),
        );
}

Widget _animatedLoadNetworkImage(String url) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: FadeInImage.assetNetwork(
        placeholder: getAsset('loading.png'),
        image: url,
        height: 500,
        fit: BoxFit.cover,
      ),
    );
