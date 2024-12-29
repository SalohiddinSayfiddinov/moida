import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:moida/menu/menu.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
    supportedLocales:const [
      Locale('en'),
      Locale('ru'),
      Locale('uz'),
     
    ],
    path: 'assets/translation',fallbackLocale:const Locale("en"),
    child:
    const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F5F3),
      ),
      home: const HomePage(),
    );
  }
}
