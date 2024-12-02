import 'package:cafe_reparo_mobile/pages/Service/adress_page.dart';
import 'package:cafe_reparo_mobile/pages/Service/contacts_page.dart';
import 'package:cafe_reparo_mobile/pages/Service/create_service_page.dart';
import 'package:cafe_reparo_mobile/pages/Service/read_user_services.dart';
import 'package:cafe_reparo_mobile/pages/User/change_password_page.dart';
import 'package:cafe_reparo_mobile/pages/User/edit_account_page.dart';
import 'package:cafe_reparo_mobile/pages/User/forgot_password_page.dart';
import 'package:cafe_reparo_mobile/pages/User/sign_in_page.dart';
import 'package:cafe_reparo_mobile/pages/User/sign_up_page.dart';
import 'package:cafe_reparo_mobile/pages/User/verify_email_page.dart';
import 'package:cafe_reparo_mobile/pages/design_page.dart';
import 'package:cafe_reparo_mobile/pages/home_page.dart';
import 'package:cafe_reparo_mobile/pages/search_page.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/': (context) => const HomePage(title: "Café Reparo"),
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
        '/create-repair': (context) => const CreateRepairPage(),
        '/contacts': (context) => const ContactsScreen(),
        '/adress': (context) => const AdressScreen(),
        '/verify': (context) => const VerifyEmailScreen(),
        '/my-repairs': (context) => const MyRepairsPage(),
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
