import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yleon/common_libs.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  //Para q se refreje en las URL
  GoRouter.optionURLReflectsImperativeAPIs = true;

  
  runApp(WondersApp());
  if (!kIsWeb) {
    FlutterNativeSplash.remove();
  }
}

class WondersApp extends StatelessWidget {
  const WondersApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: appRouter.routeInformationProvider,
      routeInformationParser: appRouter.routeInformationParser,
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.routerDelegate,
      color: $styles.colors.black,
    );
  }
}


/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons(){
  // Localizations
  GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
}

LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();

