import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yleon/logic/locale_logic.dart';
import 'package:yleon/common_libs.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  //Para q se refreje en las URL
  GoRouter.optionURLReflectsImperativeAPIs = true;

  // Start app
  registerSingletons();
  runApp(WondersApp());
  await appLogic.bootstrap();
  if (!kIsWeb) {
    
    FlutterNativeSplash.remove();
  print('paso4 ');
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
      theme: ThemeData(fontFamily: $styles.text.body.fontFamily, useMaterial3: true),
      color: $styles.colors.black,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}


/// Create singletons (logic and services) that can be shared across the app.
void registerSingletons(){
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  // Settings
  GetIt.I.registerLazySingleton<SettingsLogic>(() => SettingsLogic());
  // Localizations
  GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
}

//SettingsLogic get settingsLogic => GetIt.I.get<SettingsLogic>();
AppLogic get appLogic => GetIt.I.get<AppLogic>();
LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();
SettingsLogic get settingsLogic => GetIt.I.get<SettingsLogic>();


AppLocalizations get $strings => localeLogic.strings;
AppStyle get $styles => WondersAppScaffold.style;