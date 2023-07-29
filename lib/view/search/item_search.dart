import 'package:flutter/material.dart';

import '../../data/models/item.dart';
import '../../utils/widgets/chcekbox_items_list.dart';

class ItemSearchDelegate extends SearchDelegate<Item> {
  final List<Item> items;

  ItemSearchDelegate({required this.items});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Item(id: '', isSelected: false));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredItems =
        items.where((item) => item.id.contains(query)).toList();
    return CheckBoxItemsList(items: filteredItems);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredItems =
        items.where((item) => item.id.contains(query)).toList();
    return ListView.builder(
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredItems[index].id),
          onTap: () {
            close(context, filteredItems[index]);
          },
        );
      },
    );
  }
}
