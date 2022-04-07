
import 'dart:convert';

///- Json data -///
///Some Options for Deserializing JSON with Flutter///
/*At some point, most apps need to reach out and grab data from an online endpoint.
                          Making an HTTPS get request to pull down a weather report or the World Cup final score is fairly
                           straightforward, thanks to Dart’s http package:
import 'dart:async';
import 'package:http/http.dart' as http;

final response = await http.get(myEndpointUrl);
if (response.statusCode == 200) {
  // use the data in response.body
} else {
  // handle a failed request
}
/*Parsing JSON
Converting a JSON string into an intermediate format can be done with the dart:convert library:
import 'dart:convert';

try {
  final parsed = json.decode(aJsonStr);
} on FormatException catch (e) {
  print("That string didn't look like Json.");
} on NoSuchMethodError catch (e) {
  print('That string was null!');
}
final dynamicListOfInts = json.decode(aJsonArrayOfInts);

// Create a strongly typed list with references to the data that are casted
// immediately. This is probably the better approach for data model classes.
final strongListOfInts = List<int>.from(dynamicListOfInts);

// Or create a strongly typed list with references that will be lazy-casted
// when used.
final anotherStrongListOfInts = List<int>.from(dynamicListOfInts);
 */



==>The data in response.body is likely a JSON string, and there’s some work to be done before it’s ready for a widget?
==> First, you need to parse the string into a more manageable representation of JSON.
==>you must convert that representation into a model or some other strongly typed variable, so you can use it effectively.
=====>we have here three topics to handle the json serialization<===
*/



//the linc for the sources




//https://medium.com/flutter/some-options-for-deserializing-json-with-flutter-7481325a4450











///-1-///==>handwritten constructors?

//    Least complicated approach — no code is generated for you.
/*  You can do whatever you want, but you’re on the hook for maintaining it.
If you have a small app and the data is not that complicated,
you can go a long way by writing your own factory constructors that take a
Map<String, dynamic> parameter. For example, if you’re fetching that looks like this:*/
Map<String, Object> map = {
  "aString": "Blah, blah, blah.",
  "anInt": 1,
  "aDouble": 1.0,
  "aListOfStrings": ["one", "two", "three"],
  "aListOfInts": [1, 2, 3],
  "aListOfDoubles": [1.0, 2.0, 3.0]
};

class SimpleObject {
   SimpleObject({
    required this.aString,
    required this.anInt,
    required this.aDouble,
    required this.aListOfStrings,
    required this.aListOfInts,
    required this.aListOfDoubles,
  });

  final String aString;
  final int anInt;
  final double aDouble;
  final List<String>? aListOfStrings;
  final List<int>? aListOfInts;
  final List<double>? aListOfDoubles;

  factory SimpleObject.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw const FormatException("Null JSON provided to SimpleObject");
    }

    return SimpleObject(
      aString: json['aString'],
      anInt: json['anInt'],
      aDouble: json['aDouble'],
      aListOfStrings: json['aListOfStrings'] != null
          ? List<String>.from(json['aListOfStrings'])
          : null,
      aListOfInts: json['aListOfInts'] != null
          ? List<int>.from(json['aListOfInts'])
          : null,
      aListOfDoubles: json['aListOfDoubles'] != null
          ? List<double>.from(json['aListOfDoubles'])
          : null,
    );
  }

  final myObject = SimpleObject.fromJson(json.decode(map.toString()));
}

/*On the downside, you had to write ~20
lines of constructor code by hand, and you’re now on the hook for maintaining it.
As your app grows and your data classes start to number in the dozens, you might find yourself thinking,
“Man, coding these JSON constructors is getting tedious —
I wish they could just be auto-generated from the properties in the class.”*/
//////// auto generated ==>



///-2-///==>json_serializable?
////*
// dependencies:
//   json_annotation: ^4.4.0
//
// dev_dependencies:
//   build_runner: ^2.0.0
//   json_serializable: ^6.0.0*/

//    Generates a fromJson constructor and a toJson method for you
//    You need to include several packages in your project and use source_gen to generate partial files prior to building your app.
//    Generated source can be tricky to customize.
/*The json_serializable package uses the source_gen API to generate serialization code.
It writes the fromJson constructor (as well as a toJson method) for you.*/
///////to use the json serialization we just
// <<<<<>>>>
/*
*****>>The basic process for putting it to work in an app looks like this:
Import into your project the json_serializable and json_annotation packages.
Define a data class as you normally would.
* /*class SimpleObject {
  SimpleObject({
    this.aString,
    this.anInt,
    this.aDouble,
    this.aListOfStrings,
    this.aListOfInts,
    this.aListOfDoubles,
  });

  final String aString;
  final int anInt;
  final double aDouble;
  final List<String> aListOfStrings;
  final List<int> aListOfInts;
  final List<double> aListOfDoubles;
}*/
Add the @JsonSerializable annotation to the class definition.
/*import 'package:json_annotation/json_annotation.dart';

@JsonSerializable
class SimpleObject {
  ...
}*/
Add some extra bits to link that class with the code json_serializable creates for it.
/*Link the generated code with yours
Next up are three changes that wire the class definition to its corresponding part file:
The first of these is the part declaration, which tells the compiler to inline simple_object.g.dart (more on that in a minute). Then there’s an update to the class definition to use a mixin. Finally, update the class to use the fromJson constructor. The last two changes each reference code in the generated file.
 */
import 'package:json_annotation/json_annotation.dart';

•♂○☺ •♂○☺ •♂○☺ •♂○☺ part 'simple_object.g.dart';•♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺

@JsonSerializable()
class SimpleObject •♂○☺  extends Object with _$SimpleObjectSerializerMixin•♂○☺  {
  SimpleObject({
    this.aString,
    this.anInt,
    this.aDouble,
    this.aListOfStrings,
    this.aListOfInts,
    this.aListOfDoubles,
  });

  final String aString;
  final int anInt;
  final double aDouble;
  final List<String> aListOfStrings;
  final List<int> aListOfInts;
  final List<double> aListOfDoubles;

 •♂○☺ •♂○☺ •♂○☺ •♂○☺  factory SimpleObject.fromJson(Map<String, dynamic> json) =>
      _$SimpleObjectFromJson(json);•♂○☺ •♂○☺ •♂○☺ •♂○☺
}
 *//*

Run source_gen to generate code.
•♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ flutter packages pub run build_runner build•♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺ •♂○☺
 */
////json_annotation. example for uses >☻<
/*// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

@JsonSerializable()
class Person {
  final String firstName;
  @JsonKey(includeIfNull: false)
  final String? middleName;
  final String lastName;

  @JsonKey(name: 'date-of-birth')
  final DateTime dateOfBirth;

  @JsonKey(name: 'last-order')
  final DateTime? lastOrder;

  List<Order> orders;

  Person(
    this.firstName,
    this.lastName,
    this.dateOfBirth, {
    this.middleName,
    this.lastOrder,
    List<Order>? orders,
  }) : orders = orders ?? <Order>[];

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Order {
  int? count;
  int? itemNumber;
  bool? isRushed;
  Item? item;

  @JsonKey(
      name: 'prep-time',
      fromJson: _durationFromMilliseconds,
      toJson: _durationToMilliseconds)
  Duration? prepTime;

  @JsonKey(fromJson: _dateTimeFromEpochUs, toJson: _dateTimeToEpochUs)
  final DateTime date;

  Order(this.date);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static Duration? _durationFromMilliseconds(int? milliseconds) =>
      milliseconds == null ? null : Duration(milliseconds: milliseconds);

  static int? _durationToMilliseconds(Duration? duration) =>
      duration?.inMilliseconds;

  static DateTime _dateTimeFromEpochUs(int us) =>
      DateTime.fromMicrosecondsSinceEpoch(us);

  static int? _dateTimeToEpochUs(DateTime? dateTime) =>
      dateTime?.microsecondsSinceEpoch;
}

@JsonSerializable()
class Item {
  int? count;
  int? itemNumber;
  bool? isRushed;

  Item();

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonLiteral('data.json')
Map get glossaryData => _$glossaryDataJsonLiteral;*/
// When finished, you’ll have a new file called simple_object.g.dart sitting alongside the original. The contents look like this:
///*part of 'simple_object.dart';
//
// SimpleObject _$SimpleObjectFromJson(
//         Map<String, dynamic> json) =>
//     new SimpleObject(
//         aString: json['aString'] as String,
//         anInt: json['anInt'] as int,
//         aDouble: (json['aDouble'] as num)?.toDouble(),
//         aListOfStrings:
//             (json['aListOfStrings'] as List)?.map((e) => e as String)?.toList(),
//         aListOfInts:
//             (json['aListOfInts'] as List)?.map((e) => e as int)?.toList(),
//         aListOfDoubles: (json['aListOfDoubles'] as List)
//             ?.map((e) => (e as num)?.toDouble())
//             ?.toList());
//
// abstract class _$SimpleObjectSerializerMixin {
//   String get aString;
//   int get anInt;
//   double get aDouble;
//   List<String> get aListOfStrings;
//   List<int> get aListOfInts;
//   List<double> get aListOfDoubles;
//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'aString': aString,
//         'anInt': anInt,
//         'aDouble': aDouble,
//         'aListOfStrings': aListOfStrings,
//         'aListOfInts': aListOfInts,
//         'aListOfDoubles': aListOfDoubles
//       };
// }*/
//stateful to use
/*final myObject = SimpleObject.fromJson(json.decode(jsonString));
final myJsonStr = json.encode(myObject.toJson());*/

///-3-///==>json_serializable?

//    Generates code for serialization, immutability, toString methods, hashCode properties, and more. It’s a heavyweight solution with a lot of functionality.
//    Like json_serializable, you need to import a number of packages and use source_gen.
//    Has an extensible, plugin-based serialization architecture.
//    Has opinions about things like instance creation and mutability.
