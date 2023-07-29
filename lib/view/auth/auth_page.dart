import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/sizes.dart';
import '../../controller/auth/auth_provider.dart';
import 'widgets/login_button.dart';
import 'widgets/text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: KColors.splashColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(KImages.appIcon),
                Padding(
                  padding: EdgeInsets.all(KSizes.screenWidth(15)),
                  child: Form(
                    key: authProvider.formKey,
                    child: Column(
                      children: [
                        LoginTextField(
                          label: 'ID',
                          controller: authProvider.id,
                        ),
                        SizedBox(height: KSizes.screenHeight(5)),
                        LoginTextField(
                          label: 'Password',
                          controller: authProvider.name,
                        ),
                        SizedBox(height: KSizes.screenHeight(10)),
                        const LoginButton(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
