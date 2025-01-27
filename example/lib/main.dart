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
}
