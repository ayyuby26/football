import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'app/global_widgets/material_color.dart';
import 'app/modules/dashboard_module/dashboard_page.dart';

void main() => runApp(const GetMaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0XFFffffff)),
      ),
      home: const DashboardPage(),
    );
  }
}
