import 'package:flutter/material.dart';
import 'package:simple_print/simple_print.dart';

class Car {
  final String make;
  final String model;
  final int year;

  const Car(this.make, this.model, this.year);

  @override
  String toString() {
    return 'Car{make: $make, model: $model, year: $year}';
  }
}

class ComplexData {
  final Map<String, dynamic> data;
  final List<String> list;

  const ComplexData(this.data, this.list);

  @override
  String toString() {
    return 'ComplexData{data: $data, list: $list}';
  }
}

void main() {
  /// Prints the following:
  /// D 2025-01-27T21:11:09.432187 Car{make: Toyota, model: Corolla, year: 2022}
  const car = Car('Toyota', 'Corolla', 2022);
  printDebug(car);

  setAppTag("My App Name");

  /// Prints the following:
  /// I Car{make: Toyota, model: Camry, year: 2025}
  const car2 = Car('Toyota', 'Camry', 2025);
  printInfo(car2, timestamp: false);

  /// Prints the following:
  /// W 2025-01-27T21:11:13.849314 ComplexData{data: {key: value}, list: [one, two]}
  const complexData = ComplexData({'key': 'value'}, ['one', 'two']);
  printWarning(complexData, debugOverride: true);

  /// Prints the following:
  /// E 2025-01-27T21:11:13.850264 [Critical Error] ComplexData{data: {key: value}, list: [one, two]}
  const complexData2 = ComplexData({'key': 'value'}, ['one', 'two']);
  printError(complexData2, tag: "Critical Error", debugOverride: true);

  setAppTag("My App Name Nullable");

  /// Prints the following:
  /// E 2025-01-27T21:33:21.669605 null
  printError(null);

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  bool _debug = true;
  bool _timestamp = true;
  final _textEditingController = TextEditingController();
  String _tag = "My Tag";

  void _printDebug() {
    printDebug("Debug message",
        tag: _tag, debugOverride: _debug, timestamp: _timestamp);
  }

  void _printInfo() {
    printInfo("Info message",
        tag: _tag, debugOverride: _debug, timestamp: _timestamp);
  }

  void _printWarning() {
    printWarning("Warning message",
        tag: _tag, debugOverride: _debug, timestamp: _timestamp);
  }

  void _printError() {
    printError("Error message",
        tag: _tag, debugOverride: _debug, timestamp: _timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Tap buttons to see logs"),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Text("Print options"),
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: "Tag name",
                ),
                onChanged: (value) {
                  setState(() {
                    _tag = value;
                  });
                },
              ),
              Row(
                children: [
                  Checkbox2(
                    value: _debug,
                    onChanged: (value) {
                      setState(() {
                        _debug = value!;
                      });
                    },
                    child: const Text("Debug"),
                  ),
                  Checkbox2(
                    value: _timestamp,
                    onChanged: (value) {
                      setState(() {
                        _timestamp = value!;
                      });
                    },
                    child: const Text("Timestamp"),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.green),
          ),
          onPressed: _printDebug,
          child: const Text("Debug"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
          ),
          onPressed: _printInfo,
          child: const Text("Info"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.orange),
          ),
          onPressed: _printWarning,
          child: const Text("Warning"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
          onPressed: _printError,
          child: const Text("Error"),
        ),
      ],
    );
  }
}

class Checkbox2 extends StatelessWidget {
  final Widget child;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const Checkbox2(
      {super.key,
      required this.child,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        Checkbox(value: value, onChanged: onChanged),
      ],
    );
  }
}
