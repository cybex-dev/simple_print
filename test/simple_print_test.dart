import 'package:flutter_test/flutter_test.dart';
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
  test('simple test', () async {
    const car = Car('Toyota', 'Corolla', 2022);
    printDebug(car);

    const car2 = Car('Toyota', 'Camry', 2025);
    printInfo(car2, timestamp: false);

    const complexData = ComplexData({'key': 'value'}, ['one', 'two']);
    printWarning(complexData, debugOverride: true);

    const complexData2 = ComplexData({'key': 'value'}, ['one', 'two']);
    printError(complexData2, tag: "Critical Error", debugOverride: true);

    printError(null);

    expect('42', '42');
  });
}
