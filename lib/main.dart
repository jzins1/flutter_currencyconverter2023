import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Start entering code below here
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();
  double _dollars = 0;
  double _euros = 0;
  double _conversionRate = 1.19;

  // Any declared methods goes here
  void _convertToEuros() {
    setState(() {
      _euros = double.parse(dollarTextField.text);
      _dollars = _euros / _conversionRate;
      euroTextField.text = _dollars.toStringAsFixed(2);
    });
  }

  void _convertToDollars() {
    setState(() {
      _dollars = double.parse(euroTextField.text);
      _euros = _dollars * _conversionRate;
      dollarTextField.text = _euros.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('CIS 3334 Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Dollars'),
            TextField(controller: dollarTextField),
            ElevatedButton(
              onPressed: () {
                _convertToEuros();
              },
              child: Text("Convert to Euros"),
            ),
            Text('Euros'),
            TextField(controller: euroTextField),
            ElevatedButton(
              onPressed: () {
                _convertToDollars();
              },
              child: Text("Convert to Dollars"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
