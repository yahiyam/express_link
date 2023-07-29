import 'package:express_link/data/models/user.dart';
import 'package:express_link/utils/functions/alert_messege.dart';
import 'package:express_link/view/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final userDetails = Provider.of<UserDetails>(context);
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          color: KColors.appBarText,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        IconButton(
          icon: Image.asset(KIcons.user),
          onPressed: () {
            userDetails.showUserDetail();
          },
        ),
        IconButton(
          onPressed: () {
            showAlertMessege(context, message: 'Logout button tapped',
                onOKTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            });
          },
          icon: Image.asset(KIcons.logOut),
        ),
      ],
    );
  }
}

class UserDetails extends ChangeNotifier {
  bool _userDetails = false;
  bool get userDetails => _userDetails;

  User _user = User();
  User get user => _user;
  
  set user(User newUser) {
    _user = newUser;
    notifyListeners();
  }

  showUserDetail() {
    _userDetails = true;
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        _userDetails = false;
        notifyListeners();
      },
    );
  }
}
