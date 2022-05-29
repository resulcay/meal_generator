import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "What Will I Eat Today",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const DishPage(),
      ),
    );
  }
}

class DishPage extends StatefulWidget {
  const DishPage({Key? key}) : super(key: key);

  @override
  _DishPageState createState() => _DishPageState();
}

class _DishPageState extends State<DishPage> {
  int soupNo = 1;
  int dishNo = 1;
  int dessertNo = 1;

  List<String> soupNames = [
    'Mercimek Soup',
    'Tarhana Soup',
    'Chicken Broth Soup',
    'Düğün Soup',
    'Yogurt Soup'
  ];

  List<String> dishNames = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasülye',
    'İçli Köfte',
    'Salmon trout'
  ];
  List<String> dessertNames = [
    'Kadayıf',
    'Baklava',
    'Kazandibi',
    'Keşkül',
    'Ice Cream'
  ];

  void refresh() {
    setState(() {
      soupNo = Random().nextInt(5) + 1;
      dishNo = Random().nextInt(5) + 1;
      dessertNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                style: TextButton.styleFrom(primary: Colors.red),
                onPressed: refresh,
                child: Image.asset('assets/soup_$soupNo.jpg'),
              ),
            ),
          ),
          Text(
            soupNames[soupNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 200,
            child: Divider(
              thickness: 1,
              height: 10,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                style: TextButton.styleFrom(primary: Colors.black),
                onPressed: refresh,
                child: Image.asset('assets/dish_$dishNo.jpg'),
              ),
            ),
          ),
          Text(
            dishNames[dishNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 200,
            child: Divider(
              height: 10,
              color: Colors.black,
              thickness: 1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                style: TextButton.styleFrom(primary: Colors.blue),
                onPressed: refresh,
                child: Image.asset('assets/dessert_$dessertNo.jpg'),
              ),
            ),
          ),
          Text(
            dessertNames[dessertNo - 1],
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            width: 200,
            child: Divider(
              height: 10,
              color: Colors.black,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
