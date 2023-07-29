import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../data/models/item.dart';
import '../../view/search/item_search.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isSearch = false,
  });

  final String title;
  final bool? isSearch;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.arrow_back_ios)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          color: KColors.appBarText,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        if (isSearch ?? false)
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ItemSearchDelegate(items: items),
              );
            },
            icon: const Icon(Icons.search),
          ),
      ],
    );
  }
}
