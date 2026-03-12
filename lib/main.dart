import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pokemon_app/app/core/di/injection.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('pokemon_cache_box');

  Injection.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
