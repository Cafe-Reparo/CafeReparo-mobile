import 'package:cafe_reparo_mobile/pages/design.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:cafe_reparo_mobile/widget/Backgrounds/bg.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/Cards/custom_big_card.dart';
import 'package:cafe_reparo_mobile/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cafe_reparo_mobile/pages/signup_page.dart';
import 'package:cafe_reparo_mobile/pages/signin_page.dart';
import 'package:cafe_reparo_mobile/pages/forgot_password_page.dart';
import 'package:cafe_reparo_mobile/pages/edit_account_page.dart';
import 'package:cafe_reparo_mobile/pages/change_password_page.dart';

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
        '/': (context) => const MyHomePage(
              title: "Repair Café",
            ),
        '/design': (context) => const Design(),
        '/signup': (context) => const SignupScreen(),
        '/signin': (context) => const SigninScreen(),
        '/forgotpassword': (context) => const ForgotPasswordScreen(),
        '/editaccount': (context) => const EditAccountScreen(),
        '/changepassword': (context) => const ChangePasswordScreen(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Bg(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            CustomBigCard(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    purple.PurpleButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        text: "ir para o design system"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
