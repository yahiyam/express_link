import 'package:flutter/material.dart';

import '../../data/models/item.dart';
import '../../utils/widgets/bottom_button.dart';
import '../../utils/widgets/chcekbox_items_list.dart';
import '../../utils/widgets/custom_app_bar.dart';

class OutstationScan extends StatelessWidget {
  const OutstationScan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Outstation Scan',
        isSearch: true,
      ),
      body: CheckBoxItemsList(items: items),
      bottomNavigationBar: const BottomButton(title: 'Add 2'),
    );
  }
}
