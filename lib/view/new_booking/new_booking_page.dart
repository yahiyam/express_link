import 'package:express_link/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NewBooking extends StatelessWidget {
  const NewBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "New Booking"),
    );
  }
}
