import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statico/screens/auth/controllers/AuthController.dart';

import 'misc/constants/AppRoutes.dart';
import 'misc/localization/Messages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('hr', 'HR'),
      title: 'Statico',
      getPages: AppRoutes.routes,
      initialRoute: '/',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black38))),
        primarySwatch: Colors.blue,
        hintColor: Colors.black38,
        highlightColor: Colors.black38,
        focusColor: Colors.black38,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.grey)
      ),
    );
  }
}
