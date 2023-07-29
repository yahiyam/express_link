import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'constants/sizes.dart';
import 'view/auth/auth_page.dart';
import 'controller/auth/auth_provider.dart';
import 'controller/checkbox_selection.dart';
import 'view/home/widgets/dashboard_appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => CheckboxSelection()),
      ChangeNotifierProvider(create: (context) => UserDetails()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    KSizes.size = MediaQuery.sizeOf(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpressLink',
      theme: ThemeData(
        scaffoldBackgroundColor: KColors.background,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: KColors.bodyText,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: KColors.appBar,
          iconTheme: IconThemeData(
            color: KColors.appBarIcon,
          ),
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: KColors.overAll),
      ),
      home: const LoginPage(),
    );
  }
}
