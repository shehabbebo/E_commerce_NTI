import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shop/core/cashe/cache_data.dart';
import 'package:shop/core/cashe/cache_helper.dart';
import 'package:shop/core/translation/translation_helper.dart';
import 'package:shop/core/utils/app_assets.dart';
import 'package:shop/core/utils/routes.dart';
import 'package:shop/core/utils/string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(CacheData.lang!),
      translations: TranslationHelper(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppAssets.fontfamily),
      onGenerateRoute: appRouter.generateRouter,
      initialRoute: Routes.SplashScreen_view,
    );
  }
}
