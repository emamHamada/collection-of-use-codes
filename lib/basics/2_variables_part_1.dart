// ignore_for_file: unused_local_variable

void main() {
  var x = 10;
  const y = 3.5;
  final z = 'Ali';
  var s = false;

  print('x=$x');
  x = 20;
  print('x=$x');
  print('y=$y');
  print('z=$z');
  print('s=$s');

  // Even in type-safe Dart code, most variables don’t need explicit types, thanks to type inference:

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
}
