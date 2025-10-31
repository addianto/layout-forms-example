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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OriginalExamplePage(),
        '/more-widget-examples': (context) => const MoreWidgetExamplesPage(),
      },
    );
  }
}

class OriginalExamplePage extends StatelessWidget {
  const OriginalExamplePage({super.key});

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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/more-widget-examples');
              },
              label: const Text('More Widget Examples'),
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreWidgetExamplesPage extends StatelessWidget {
  const MoreWidgetExamplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Widget Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const <Widget>[
          ExampleSection(title: '1. Container', child: Text('')),
          ExampleSection(title: '2. Expanded & Flexible', child: Text('')),
          ExampleSection(title: '3. Stack', child: Text('')),
          ExampleSection(title: '4. GridView', child: Text('')),
        ],
      ),
    );
  }
}

class ExampleSection extends StatelessWidget {
  final String title;
  final Widget child;

  const ExampleSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.headlineSmall,),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: child,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
