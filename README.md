# simple_print

Takes print() to the next level with custom print functions.

A simple print package that allows you to print messages with a timestamp, tag, and log level. For example
```dart
setAppTag('Car Details Screen');
const car = Car('Toyota', 'Corolla', 2022);
printDebug(car, timestamp: true, tag: '/api/v1/car/1/details');
```

would print the following:
```
D 2025-01-27T21:11:09.432187 [Car Details Screen] [/api/v1/car/1/details] Car{make: Toyota, model: Corolla, year: 2022}
```

## Installation

```dart
dependencies:
  simple_print: any
```

## Import

```dart
import 'package:simple_print/simple_print.dart';
```

## Usage

```dart
class DboObject{
    final String name;
    final int id;
    
    const DboObject({required this.name, this.id = 1});
    
    @override
    String toString() {
        return 'DboObject{name: $name, id: $id}';
    }
}

class UserObject{
    final String username;
    final String password;
    
    const UserObject({required this.username, required this.password});
    
    @override
    String toString() {
        return 'UserObject{username: $username, password: $password}';
    }
}

void main() {
  printDebug('Debug message');
  
  final dboObject = DboObject(name: "DboObject");
  printInfo(dboObject, timestamp: false);
  
  final userObject = UserObject(username: "user", password: "password");
  printWarning(userObject, timestamp: true, tag: "Login Screen");
  
  printError(null, timestamp: true);
}
```

## Functions

All print functions have the following signature:

```dart
void printFunction(dynamic message, { String? tag, bool timestamp = false, bool debugOverride = kDebugMode });
```

- `message`: The message to print, calls the `toString()` method on the object or prints null if the object is null.
- `tag`: The tag to print before the message. Use the appTag to set a global tag for all messages by calling `setAppTag().`
- `timestamp`: Whether to print the timestamp before the message.
- `debugOverride`: Whether to print the message in debug mode. If false, the message will only be printed in release mode.

## Logging functions
- `printDebug`: Prints a debug message.
- `printInfo`: Prints an info message.
- `printWarning`: Prints a warning message.
- `printError`: Prints an error message.

### Log Levels
- Debug: a debug message, provides additional information for debugging purposes.
- Info: an informational message, provides information about the application's state.
- Warning: a warning message, provides information about potential issues.
- Error: an error message, provides information about errors that occurred.

For more reading, please see [log levels](https://sematext.com/blog/logging-levels/) on sematext or for the more technically inclined, read more about the [log levels with syslog](https://en.wikipedia.org/wiki/Syslog#Severity_levels).

##

PR and contributions are welcome. Please open an issue if you have any suggestions or improvements.

