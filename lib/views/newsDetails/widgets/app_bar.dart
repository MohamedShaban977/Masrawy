import 'package:flutter/material.dart';
import 'package:masrawy/views/newsDetails/cubits/controller.dart';
import 'package:share/share.dart';

newsDetailsAppBar(context){
  final detailsModel = NewsDetailsController.get(context).newsDetailsModel;
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(detailsModel == null ? '' : detailsModel.result.categoryName,style: TextStyle(fontSize: 17),),
    centerTitle: false,
    titleSpacing: -10,
    actions: [
      IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){
        print(detailsModel.result.postUrl);
        Share.share(detailsModel.result.postUrl);

      }),
    ],
  );
}