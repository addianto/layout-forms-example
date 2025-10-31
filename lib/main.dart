import 'package:flutter/material.dart';

void main() {
  runApp(LayoutsFormsExample());
}

class LayoutsFormsExample extends StatelessWidget {
  const LayoutsFormsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layouts with Row and Column')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Widgets arranged in a Column:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
                ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
                ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'This text is also in the Column, below the Row.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
