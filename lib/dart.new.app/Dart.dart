// dart safty and type inferance

// variable scope

// ternary condetional operators

//  static , dynamic and optionaly types of programming language

// anonemous functions and named functions

// serialization (example is => .toString()), json and cascading notation

// complex and simple data types

//  cascading notation

// private variable and getters ، setters

// intializer list in dart

// key words in dart

// null safty and null awareness  ,, null aware operators ,, null access operator ,, nul assertion operator == as String -any datatype-; sound null safty

// collections an dart => list => set => map => hiegher order methods

// suncronous vs asyncronous

// event loop in dart

// future data type

// async and await with try and catch , future and .then with .catcherror and .whencomplete

// api , networking

// http protocole

// dart:io , dart:convert

// future main function

// url parsing to uri

// http status codes

// How to create constructors

// Different ways to specify parameters

// When and how to create getters and setters

// How Dart handles privacy

// How to create factories

// How functional programming works in Dart

// Other core Dart concepts

// Dart's main method is named main(). If you need access to command-line arguments, you can add them: main(List<String> args) as java code .

// If you forget the semicolon (;) at the end of a no-body constructor, DartPad displays the following error: "A function body must be provided."

// Remove the optional new keyword:  => var bike = Bicycle(2, 0, 1);

//
/*
 * he new keyword became optional in Dart 2.
 * If you know that a variable's value won't change, then you can use final instead of var.
 * The print() function accepts any object (not just strings).
 * It converts it to a String using the object's toString() method. 
 * Add the following toString() method anywhere in the Bicycle class:
@override
String toString() => 'Bicycle: $speed mph';
*/

// to create private in dart ==> int _speed = 0;  int get speed => _speed;

//By default, Dart provides implicit getters and setters for all public instance variables. You don't need to define your own getters or setters unless you want to enforce read-only or write-only variables, compute or verify a value, or update a value elsewhere.

// private using _x and optional parameters instead of overloading in java .

// using impelcite getter and setter in dart declaration .

// optopnal parameters===>
/**
import 'dart:math';

class Rectangle {
  int width;
  int height;
  Point origin;

  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});

  @override
  String toString() =>
      'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200));
  print(Rectangle(origin: const Point(10, 10)));
  print(Rectangle(width: 200));
  print(Rectangle());
}
 */
