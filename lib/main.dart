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
          ExampleSection(title: '1. Container', child: _ContainerExample()),
          ExampleSection(
            title: '2. Expanded & Flexible',
            child: _ExpandedFlexibleExample(),
          ),
          ExampleSection(title: '3. Stack', child: _StackExample()),
          ExampleSection(title: '4. GridView', child: _GridViewExample()),
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
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
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

class _ContainerExample extends StatelessWidget {
  const _ContainerExample();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.amber.shade600, width: 2),
      ),
      child: const Text(
        'This is a Container widget. It has margin, padding, and a coloured border.',
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _ExpandedFlexibleExample extends StatelessWidget {
  const _ExpandedFlexibleExample();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: const Text(
              'Expanded (flex: 2)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.green,
            child: const Text(
              'Flexible',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.blue,
            child: const Text(
              'Expanded (flex: 1)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class _StackExample extends StatelessWidget {
  const _StackExample();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(width: 200, height: 200, color: Colors.red.shade200),
        Positioned(
          top: 20,
          right: 20,
          child: Container(width: 80, height: 80, color: Colors.red.shade400),
        ),
        const Icon(Icons.check_circle, color: Colors.white, size: 64),
      ],
    );
  }
}

class _GridViewExample extends StatelessWidget {
  const _GridViewExample();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.purple.shade100,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}
