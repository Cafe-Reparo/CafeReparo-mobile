import 'package:cafe_reparo_mobile/themes/colors.dart';
import 'package:cafe_reparo_mobile/themes/custom_themes.dart';
import 'package:cafe_reparo_mobile/widget/purple_button.dart' as purple;
import 'package:cafe_reparo_mobile/widget/red_button.dart' as red;
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Café Reparo'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'titulo',
              style: Theme.of(context).primaryTextTheme.titleLarge?.copyWith(
                    color: MyColors.primary500,
                  ),
            ),
            DropdownButtonFormField<String>(
              iconEnabledColor: MyColors.primary400,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                prefixIcon: Icon(Icons.person, color: MyColors.primary400),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Item 1',
                  child: Text('Item 1'),
                ),
                DropdownMenuItem(
                  value: 'Item 2',
                  child: Text('Item 2'),
                ),
              ],
              onChanged: (value) {},
              hint: const Text(
                'Selecione um item',
                style: TextStyle(color: MyColors.primary400),
              ),
            ),
            const SizedBox(
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Digite algo',
                ),
              ),
            ),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.add)),
            purple.PurpleButton(
                onPressed: () => {},
                text: "Continuar",
                type: purple.ButtonType.fill),
            purple.PurpleButton(
                onPressed: () => {},
                text: "text",
                type: purple.ButtonType.outline),
            red.RedButton(
              onPressed: () => {},
              text: "text",
              type: red.ButtonType.outline,
            ),
            const Text(
              'Quantidade de vezes que você apertou o botão:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
