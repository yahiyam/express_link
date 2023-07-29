import 'package:express_link/constants/colors.dart';
import 'package:express_link/constants/icons.dart';
import 'package:express_link/constants/sizes.dart';
import 'package:express_link/view/delivery_task_list/delivery_task_list_page.dart';
import 'package:express_link/view/home/widgets/dashboard_appbar.dart';
import 'package:express_link/view/new_booking/new_booking_page.dart';
import 'package:express_link/view/outstation_scan/outstation_scan_page.dart';
import 'package:express_link/view/prepare_drs/prepare_drs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserDetails>(context);
    return Scaffold(
      appBar: const DashboardAppBar(title: 'Dashboard'),
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Padding(
            padding: EdgeInsets.all(KSizes.screenWidth(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const NavigateTile(
                  icon: KIcons.prepare,
                  title: 'Prepare DRS',
                  navigate: PrepareDRS(),
                ),
                const NavigateTile(
                  icon: KIcons.delivery,
                  title: 'Delivery Task List',
                  navigate: DeliveryTaskList(),
                ),
                const NavigateTile(
                  icon: KIcons.outStation,
                  title: 'Outstation Scan',
                  navigate: OutstationScan(),
                ),
                SizedBox(height: KSizes.screenHeight(5)),
                const Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const NavigateTile(
                  icon: KIcons.newBooking,
                  title: 'New Booking',
                  navigate: NewBooking(),
                ),
              ],
            ),
          ),
          if (userDetails.userDetails)
            Positioned(
              right: KSizes.screenWidth(3),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: KColors.tooltipBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ID : ${userDetails.user.id}',
                      style: const TextStyle(color: KColors.descriptionText),
                    ),
                    Text(
                      'Name: ${userDetails.user.name}',
                      style: const TextStyle(color: KColors.descriptionText),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NavigateTile extends StatelessWidget {
  const NavigateTile({
    super.key,
    required this.title,
    required this.navigate,
    required this.icon,
  });

  final String title;
  final Widget navigate;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: KColors.tileText,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => navigate,
        ));
      },
    );
  }
}
