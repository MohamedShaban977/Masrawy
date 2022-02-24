import 'package:flutter/material.dart';
import 'package:masrawy/core/router/router.dart';
import 'package:masrawy/views/search/cubits/controller.dart';
import '../../../constants.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = SearchController.get(context);
    return TextField(
      autofocus: true,
      controller: controller.searchController,
      onChanged: (v) => controller.search(),
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          hintText: 'بحث',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
            // onPressed: ()=> controller.searchController.clear(),
            onPressed: MagicRouter.pop,
          )),
    );
  }
}
