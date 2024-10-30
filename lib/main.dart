import 'package:cafe_reparo_mobile/pages/view_movie.dart';
import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:cafe_reparo_mobile/widget/Buttons/green_button.dart' as green;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Café Reparo',
      theme: CustomThemes().defaultTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: "Book Catalog",),
        '/view-book': (context) => const ViewBook(),
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            green.GreenButton(
              onPressed: () {
                Navigator.pushNamed(context, '/view-book');
              },
              text: "book 1",
            ),
          ],
        ),
      ),
    );
  }
}
