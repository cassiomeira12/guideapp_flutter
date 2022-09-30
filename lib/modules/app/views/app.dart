import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../../../localizations/translation.dart';
import '../../../styles/themes/light_theme.dart';
import '../app_bindings.dart';
import '../app_router.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Guide App',
      theme: LightTheme.theme(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initial,
      getPages: AppRouter.pages,
      initialBinding: AppBindings(),
      translations: Translation(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
