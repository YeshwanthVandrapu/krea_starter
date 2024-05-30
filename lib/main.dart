import 'package:erp_starter/home_schedule/controller.dart';
import 'package:erp_starter/home_screen1.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  Get.put(ScheduleController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff275C9D)),
        useMaterial3: true,
      ),
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => const Home(),
      // },
      home: const Home(),
    );
  }
}
