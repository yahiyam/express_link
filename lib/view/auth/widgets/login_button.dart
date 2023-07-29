import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../controller/auth/auth_provider.dart';
import '../../../data/models/user.dart';
import '../../home/home_page.dart';
import '../../home/widgets/dashboard_appbar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return ElevatedButton(
          onPressed: () {
            if (authProvider.formKey.currentState!.validate()) {
              authProvider.isLoading
                  ? null
                  : authProvider.authenticate().then((value) {
                      User user = User(
                        id: authProvider.id.text,
                        name: authProvider.name.text,
                      );
                      final userDetails =
                          Provider.of<UserDetails>(context, listen: false);
                      userDetails.user = user;
                      return Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    });
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: KColors.button),
          child: Center(
            child: authProvider.isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        KColors.buttonText,
                      ),
                    ),
                  )
                : const Text(
                    'Login',
                    style: TextStyle(
                      color: KColors.buttonText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
