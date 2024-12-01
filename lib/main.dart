import 'package:cafe_reparo_mobile/pages/Service/adress_page.dart';
import 'package:cafe_reparo_mobile/pages/Service/contacts_page.dart';
import 'package:cafe_reparo_mobile/pages/Service/create_service_page.dart';
import 'package:cafe_reparo_mobile/pages/User/change_password_page.dart';
import 'package:cafe_reparo_mobile/pages/User/edit_account_page.dart';
import 'package:cafe_reparo_mobile/pages/User/forgot_password_page.dart';
import 'package:cafe_reparo_mobile/pages/User/sign_in_page.dart';
import 'package:cafe_reparo_mobile/pages/User/sign_up_page.dart';
import 'package:cafe_reparo_mobile/pages/design_page.dart';
import 'package:cafe_reparo_mobile/pages/search_page.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cafe_reparo_mobile/pages/Service/read_page.dart';
import 'pages/User/verify_email_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Reparo',
      initialRoute: '/create-service',
      routes: {
        '/': (context) => const EditAccountScreen(),
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
        '/read': (context) => const ReadPage(),
        '/verify': (context) => const VerifyEmailScreen(),
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
