import 'package:express_link/constants/colors.dart';
import 'package:express_link/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../data/models/item.dart';
import '../../utils/widgets/custom_app_bar.dart';

class DeliveryTaskList extends StatelessWidget {
  const DeliveryTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Delivery Task List',
        isSearch: true,
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: KSizes.screenHeight(3.3),
              horizontal: KSizes.screenWidth(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].id,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: KSizes.screenWidth(5)),
                Text(
                  items[index].id,
                  style: const TextStyle(
                    color: KColors.descriptionText,
                  ),
                ),
                Text(
                  items[index].id,
                  style: const TextStyle(
                    color: KColors.descriptionText,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
