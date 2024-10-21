import 'package:flutter/material.dart';
import 'package:food_delivery/pages/admin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/pages/controller/Admine_controller.dart';
import 'package:food_delivery/pages/controller/order_controller.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);

  //register the controller
  Get.put(HomeController());
  Get.put(OrderController());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdminPage(),
    );
  }
}
