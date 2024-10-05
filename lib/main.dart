import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppRoutes
          .LOGIN, // Corrected to refer to an existing route (e.g., LOGIN)
      getPages: AppPages
          .pages, // Corrected to refer to AppPages.pages (assuming 'pages' not 'routes')
    ),
  );
}
