import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? name;
  String? age;
  String? height;
  bool? developer;
  String? skills;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          "Shard preferences ",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //to set data manually you can use initState to do this automatically
            ElevatedButton(
              onPressed: () async {
                await setData();

                debugPrint(" you here set the data firstly \n$name\n$age\n$developer\n$height\n$skills");
              },
              child: const Text(
                "setData",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await getData();

                debugPrint("\n$name\n$age\n$developer\n$height\n$skills");
              },
              child: const Text(
                "getData",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

//to set data to shared preferences انت هنا بتخزن الداتا جوا الكي بتاعها
  setData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString('Name', 'Hamada');
    _pref.setInt('Age', 24);
    _pref.setDouble('Height', 174.5);
    _pref.setBool('Developer', true);
    _pref.setStringList('Skills', ['Dart', 'Flutter']);
  }

// get data انت هنا بتجيب الداتا المتخزنه ف الشيرد علشان تخزنها جوا متغيرات وبتبقي سهله الاستخدام فقط استدعيها
  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    name = _pref.getString('Name');
    age = _pref.getInt('Age').toString();
    height = _pref.getDouble('Height').toString();
    developer = _pref.getBool('Developer');
    skills = _pref.get('Skills').toString();
  }
}
