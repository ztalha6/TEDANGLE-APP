import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tedangle/app/app_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qmeabozriskijyazuobo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFtZWFib3pyaXNraWp5YXp1b2JvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjA4MjM1NjksImV4cCI6MTk3NjM5OTU2OX0.2pHCOvV01BmBY3pz82ghve6QNMUnaZL9-g73ZJKcLXk',
  );
  Get.put(AppService());
  runApp(
    GetX<AppService>(builder: (model) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: model.appName.value,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }),
  );
}
