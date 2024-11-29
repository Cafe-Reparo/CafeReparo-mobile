import 'package:cafe_reparo_mobile/pages/adress_page.dart';
import 'package:cafe_reparo_mobile/pages/change_password_page.dart';
import 'package:cafe_reparo_mobile/pages/contacts_page.dart';
import 'package:cafe_reparo_mobile/pages/create_service_page.dart';
import 'package:cafe_reparo_mobile/pages/design_page.dart';
import 'package:cafe_reparo_mobile/pages/edit_account_page.dart';
import 'package:cafe_reparo_mobile/pages/forgot_password_page.dart';
import 'package:cafe_reparo_mobile/pages/home_page.dart';
import 'package:cafe_reparo_mobile/pages/search_page.dart';
import 'package:cafe_reparo_mobile/pages/sign_in_page.dart';
import 'package:cafe_reparo_mobile/pages/sign_up_page.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Reparo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Café Reparo'),
        '/design': (context) => const Design(),
        '/sign-up': (context) => const SignupScreen(),
        '/sign-in': (context) => const SigninScreen(),
        '/search-page': (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return SearchPage(query: args);
        },
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/edit-account': (context) => const EditAccountScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/create-service': (context) => const CreateServiceScreen(),
        '/contacts': (context) => const ContactsScreen(),
        '/adress': (context) => const AdressScreen(),
      },
      theme: CustomThemes().defaultTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
