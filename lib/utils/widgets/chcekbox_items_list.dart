import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/checkbox_selection.dart';

class CheckBoxItemsList extends StatelessWidget {
  const CheckBoxItemsList({
    super.key,
    required this.items,
  });
  final List items;

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckboxSelection>(
      builder: (context, checkbox, _) {
        return Column(
          children: [
            Row(
              children: [
                const Spacer(),
                const Text('Select All'),
                Checkbox(
                  value: checkbox.isAllSelected,
                  onChanged: (newValue) =>
                      checkbox.onSelectedAll(newValue, items),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text('item : ${items[index].id}'),
                    value: items[index].isSelected,
                    onChanged: (newValue) =>
                        checkbox.onCheckboxChanged(newValue, index, items),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
