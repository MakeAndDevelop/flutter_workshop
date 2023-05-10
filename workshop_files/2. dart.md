## Dart

Dart is simalar to other C-style languages like `C#`, `Java` and `javascript/typescript`
Dart is strong typed since version 2.0
Dart supports null safety since version 2.19

### Null Safety
Dart has built-in null safety features, such as the null-aware operator `?.` and the null-coalescing operator `??`. In addition Dart allows you to use optional types with the `?` symbol, which can be null.
```dart
String? nullableString;
int? length = nullableString?.lenght; // If nullableString is null length will be null
int value = length ?? 0; // If length is null, value will be 0
```
---

### Async and Await

Dart supports asynchronous programming using the `async` and `await` keywords, which are used to write non-blocking code that can perform time-consuming operations (e.g., network requests or file I/O) without blocking the main execution thread.

#### `async`

The `async` keyword is used to mark a function as asynchronous. An `async` function returns a `Future` object that represents the result of an asynchronous operation. Inside an `async` function, you can use the `await` keyword to wait for a `Future` to complete before proceeding with the execution.

#### `await`

The `await` keyword is used inside an `async` function to pause the execution of the function until the awaited `Future` is completed. This allows you to write asynchronous code that looks similar to synchronous code, making it more readable and easier to understand.

#### Example

```dart
import 'dart:async';

Future<String> fetchData() async {
  // Simulating network latency
  await Future.delayed(Duration(seconds: 2));
  return 'Data fetched';
}

void main() async {
  print('Fetching data...');
  String data = await fetchData();
  print(data); // Output: Data fetched
}
```
---

### Important keywords:
#### `var`

The `var` keyword is used to declare a variable without specifying its type explicitly. Dart's type inference system will automatically infer the type based on the assigned value.

```dart
var name = 'John'; // String
var age = 30; // int
var weight = 72.5; // double
var isStudent = true; // bool
```

#### `const`
The const keyword is used to declare a constant variable, which means its value cannot be changed after initialization. const variables must have their values assigned at compile time.

```dart
const String workshopName = "Build your first flutter app"
class Constants {
    static const String trainerName = "Duco Fronik" 
}
```

#### `final`

The `final` keyword is used to declare a variable that can only be set once. Its value must be assigned at runtime, and it cannot be changed afterwards. This is useful when you want to create a variable with a value that won't change but is determined at runtime.
```dart
final DateTime currentTime = DateTime.now();
``` 

#### `late`
The `late` keyword is used to declare a non-nullable variable that is not immediately initialized. This is useful when the value of a variable is determined after some computation or a certain condition is met. However, you must ensure that the variable is assigned a non-null value before it is used; otherwise, a runtime error will occur. Because of this restriction you should always aim to avoid the use of late and look for a better solution that's compatible with null safety.

```dart
late int result;

void main() {
  fetchData().then((data) {
    result = processData(data);
    print(result);
  });
}
```
---

### Cascades:
Dart has a cascade operator .. that allows you to perform a sequence of operations on the same object.
```dart
var person = Person()
  ..name = 'John'
  ..age = 30
  ..greet();
```
---

### Spread operator:
In Dart, the spread operator (`...`) is used to insert all elements from a collection into another collection. It is particularly useful when working with lists.
```dart
List<int> evenNumbers = [2, 4, 6];
List<int> oddNumbers = [1, 3, 5];

List<int> allNumbers = [...evenNumbers, ...oddNumbers];
print(allNumbers); // Output: [2, 4, 6, 1, 3, 5]
```

Dart also provides a null-aware spread operator (...?), which is used when you want to insert elements from a collection that might be null. If the collection is null, the null-aware spread operator will not throw an error and will just skip the collection.

```dart
List<int> evenNumbers;
List<int> oddNumbers = [1, 3, 5];

List<int> allNumbers = [...?evenNumbers, ...oddNumbers];
print(allNumbers); // Output: [1, 3, 5]
```
---

### Generics:
Dart supports generic programming, allowing you to write reusable and type-safe code.

```dart
class Box<T> {
  final T item;
  
  Box(this.item);

  T getItem() {
    return item;
  }
}

void main() {
  Box<int> intBox = Box(42);
  print(intBox.getItem()); // Output: 42
}
```
---

### Extension methods:
Dart allows you to add new functionality to existing classes using extension methods.
```dart
extension StringCapitalize on String {
  String capitalize() {
    return '${this[0].toUpperCase()}{this.substring(1)}';
  }
}

void main() {
  print('hello world'.capitalize()); // Output: Hello world
}
```

### Mixins:
Dart supports mixins, which allow you to reuse a class's code in multiple class hierarchies.
```dart
mixin Flyable {
  void fly() {
    print('I can fly');
  }
}

class Bird extends Animal with Flyable {}
```
---

### Top-level functions and variables:
In Dart, you can define functions and variables outside of any class, making them top-level functions.

```dart
void main() {
  print(square(4)); // Output: 16
}

int square(int number) {
  return number * number;
}
```

---

### Multi-threading with `compute`:
In Flutter, the `compute` method is a utility function that allows you to run a potentially expensive, CPU-bound operation on a separate isolate. This helps you avoid blocking the main UI thread, ensuring smooth and responsive user experiences.

#### Isolates

In Dart, isolates are separate execution threads that do not share memory with the main thread or other isolates. This means that each isolate has its own heap and stack, preventing the need for synchronization or locks when working with data. The communication between isolates is performed using message passing.

#### Using the Compute Method

The compute function takes two arguments:

A top-level function or a static method that performs the expensive operation.
The input data for the function.
The compute function returns a Future that resolves with the result of the provided function once it completes.

```dart
import 'dart:async';
import 'package:flutter/foundation.dart';

int performExpensiveOperation(int value) {
  // Simulate an expensive operation
  return value * value;
}

Future<void> main() async {
  print('Starting the expensive operation...');
  int result = await compute(performExpensiveOperation, 42);
  print('Result: $result'); // Output: Result: 1764
}
```




