// 1- variables

// 2- data types

// 3- functions

// 4- built in methods and math methods

// 5- oop

// 6- asynchronous programming

// 7- nullability

// 8- collections

// 9- files

// 10- streams

// 11- factory  ==?>> important words about factory ==> Factories, a commonly used design pattern in Java, have several advantages over direct object instantiation, such as hiding the details of instantiation, providing the ability to return a subtype of the factory's return type, and optionally returning an existing object rather than a new object.
/**
 Create a factory
Factories, a commonly used design pattern in Java, have several advantages over direct object instantiation, 
such as hiding the details of instantiation,
providing the ability to return a subtype of the factory's return type, and 
optionally returning an existing object rather than a new object.

This step demonstrates two ways to implement a shape-creation factory:

Option 1: Create a top-level function.
Option 2: Create a factory constructor.

 Create a factory constructor
Use Dart's factory keyword to create a factory constructor.


example ==> ?
import 'dart:math';

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

main() {
  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);
}


 */
/*import 'dart:math';

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    // To trigger exception, don't implement a check for 'triangle'.
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

class Triangle implements Shape {
  final num side;
  Triangle(this.side);
  num get area => pow(side, 2) / 2;
}

main() {
  try {
    print(Shape('circle').area);
    print(Shape('square').area);
    print(Shape('triangle').area);
  } catch (err) {
    print(err);
  }
}*/

// 12- future

// 13- API

// 15- http

// 16- error handling

// 17- high order methods

// 18- serialization

// 19- json

// 20- cascade notation

// 21- functions

// 22- controle flow

// 23- ternary condetions operators

// 24- file system

// 25- dart packages

// 26- async , await

// 27- required , late , this , static , factory

// 28- overriding and inheritance

// 29- constructors , super , super constructors

// 30- mixin

// 31- datetime

// 32- plateform

// 33- operator overloading

// 34- polymorphisim

// 35- laxical clouser , calable functions

// 36- extention function

// 37- generic

// 38- enum

// 39- optional , named parameters

// 40- collections and type casting

// 41- interfaces
/**
 The Dart language doesn't include an interface keyword because every class defines an interface.
 every class introduce an interface => 
 import 'dart:math';

abstract class Shape {
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

class CircleMock implements Circle {
  num area = 0;
  num radius = 0;
}

main() {
  final circle = Shape('circle');
  final square = Shape('square');
  print(circle.area);
  print(square.area);
}

 */

// 42- layers of seperating logic and ui from databases

// 43- dart SDK

// 44- Hello World

// 45- Variables

// 46- Control flow statements

// 47- Functions

// 48- Comments

// 49- Imports

// 50- Classes

// 51- Enums

// 52- Inheritance

// 53- Mixins

// 54-Interfaces and abstract classes

// 55- Async

// 56- Exceptions
/*exception(){
  try {
  for (final object in flybyObjects) {
    var description = await File('$object.txt').readAsString();
    print(description);
  }
} on IOException catch (e) {
  print('Could not describe object: $e');
} finally {
  flybyObjects.clear();
}
}*/

// 57- dart library

/*
dart:core
Built-in types, collections, and other core functionality. This library is automatically imported into every Dart program.
dart:async
Support for asynchronous programming, with classes such as Future and Stream.
dart:math
Mathematical constants and functions, plus a random number generator.
dart:convert
Encoders and decoders for converting between different data representations, including JSON and UTF-8.
dart:html
DOM and other APIs for browser-based apps.
dart:io
I/O for programs that can use the Dart VM, including Flutter apps, servers, and command-line scripts.
 */

// 58- assert(condetion);

/** command to add assert method to a dart program ==> dart --enable-asserts file_name.dart 

 
import 'package:meta/meta.dart';

class Product {
  final int id;
  final String name;
  final int price;
  final String size;
  final String image;
  final int weight;

  const Product({
    @required this.id,
    @required this.name,
    @required this.price,
    this.size,
    this.image,
    this.weight,
  }) : assert(id != null && name != null && price != null);
}

///////////

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    this.size,
    this.image,
    this.weight,
  })  : assert(id > 0),
        assert(name.isNotEmpty),
        assert(price > 0.0);

  final int id;
  final String name;
  final double price;
  final String? size;
  final String? image;
  final int? weight;
}
 */

// 59- dart private getter and setter ==>
/**
 * 
 class Bicycle {
  int cadence;
  int _speed = 200;
  int get speed => _speed;
  int gear;

  Bicycle(this.cadence, this.gear);

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}

void main() {
  var bike = Bicycle(2, 1);
  print(bike);
}
 */
// 60-

/*
When a “function” sits on the top of every Class, Object, or Interface, we call it the top-level function. It is not nested inside any other function, or any structure, whatsoever.

As we just said. The “top-level” function sits on the top of any hierarchy of Class or Function.

The best example is the “main()” function in Dart and Flutter. It is the entry point.

Certainly, we can write another top level function on the top of the main() function. But, to declare it, we need to use the entry-point which is the main() function.

Let us see one simple example.

void aTopLevelFunction() {} // A top-level function
main() {
Function anyFunctionInsideTopLevelFunction;

  // Comparing top-level functions.
  anyFunctionInsideTopLevelFunction = aTopLevelFunction;
  if (aTopLevelFunction == anyFunctionInsideTopLevelFunction) {
    print('A top level function is same as any function '
        ' inside a top-level function.');
  }
}

// #output: A top level function is same as any function  inside a top-level function.

 */

// 61- Difference between Static Method and Instance Method
/**
 void aTopLevelFunction() {} // A top-level function

class AClass {
  static void aStaticMethod() {} // A static method
  void anInstanceMethod() {} // An instance method
}

main() {
  /// Every app must have a top-level main() function,
  /// which serves as the entrypoint to the app.
  /// The main() function returns void
  /// it has an optional List<String> parameter for arguments.

  /// everything in Dart is Object
  /// even functions are objects and have a type, Function
  ///

  /// All functions return a value. If no return value is
  /// specified, the statement return null
  ///
  catchYou() {}

  if (catchYou() == null) {
    print('It returns null.');
  }

  /// we can declare any function inside any top-level function

  Function anyFunctionInsideTopLevelFunction;

  // Comparing top-level functions.
  anyFunctionInsideTopLevelFunction = aTopLevelFunction;
  if (aTopLevelFunction == anyFunctionInsideTopLevelFunction) {
    print('A top level function is same as any function '
        ' inside a top-level function.');
  }

  // Comparing static methods.
  anyFunctionInsideTopLevelFunction = AClass.aStaticMethod;
  if (AClass.aStaticMethod == anyFunctionInsideTopLevelFunction) {
    print('Any function inside a top level function '
        ' is as same as a static method.');
  }

  // Comparing instance methods.
  var firstInstanceOfAClass = AClass(); // first Instance of AClass
  var secondInstanceOfAClass = AClass(); // second Instance of AClass
  var aVariable = secondInstanceOfAClass;
  anyFunctionInsideTopLevelFunction = secondInstanceOfAClass.anInstanceMethod;

  // These closures refer to the second instance,
  // so they're equal.
  if (aVariable.anInstanceMethod == anyFunctionInsideTopLevelFunction) {
    print('These closures refer to the second instance,'
        ' so they\'re equal.');
  }

  // These closures refer to different instances,
  // so they're unequal.
  if (firstInstanceOfAClass.anInstanceMethod !=
      secondInstanceOfAClass.anInstanceMethod) {
    print('These closures refer to different instances,'
        ' so they\'re unequal.');
  }
}
/**
// output

It returns null.
A top level function is same as any function  inside a top-level function.
Any function inside a top level function  is as same as a static method.
These closures refer to the second instance, so they're equal.
These closures refer to different instances, so they're unequal.


*/
 */

// 62- iterable =>
/**
How to read elements of an Iterable.
How to check if the elements of an Iterable satisfy a condition.
How to filter the contents of an Iterable.
How to map the contents of an Iterable to a different value.
What are collections?
A collection is an object that represents a group of objects, which are called elements. Iterables are a kind of collection.

What is an Iterable?
An Iterable is a collection of elements that can be accessed sequentially.

In Dart, an Iterable is an abstract class, meaning that you can’t instantiate it directly. However, you can create a new Iterable by creating a new List or Set.

Both List and Set are Iterable, so they have the same methods and properties as the Iterable class.

A Map uses a different data structure internally, depending on its implementation. For example, HashMap uses a hash table in which the elements (also called values) are obtained using a key. Elements of a Map can also be read as Iterable objects by using the map’s entries or values property.

This example shows a List of int, which is also an Iterable of int:

Iterable<int> iterable = [1, 2, 3];
The difference with a List is that with the Iterable, you can’t guarantee that reading elements by index will be efficient. Iterable, as opposed to List, doesn’t have the [] operator.

For example, consider the following code, which is invalid:

Iterable<int> iterable = [1, 2, 3];
int value = iterable[1];
If you read elements with [], the compiler tells you that the operator '[]' isn’t defined for the class Iterable, which means that you can’t use [index] in this case.

You can instead read elements with elementAt(), which steps through the elements of the iterable until it reaches that position.

Iterable<int> iterable = [1, 2, 3];
int value = iterable.elementAt(1);
Continue to the next section to learn more about how to access elements of an Iterable.
void main() {
  const iterable = ['Salad', 'Popcorn', 'Toast'];
  for (final element in iterable) {
    print(element);
  }
}
same as =>
void main() {
  Iterable<String> iterable = ['Salad', 'Popcorn', 'Toast'];
  for (final element in iterable) {
    print(element);
  }
}

hint/?
Behind the scenes, the for-in loop uses an iterator. You rarely see the Iterator API used directly, however, because for-in is easier to read and understand, and is less prone to errors.

 */