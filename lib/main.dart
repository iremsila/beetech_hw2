import 'dart:async';

import 'package:beetech/viewall.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp eklenmiştir
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  late Row dotRow;
  late int countdown;


  Color dot1 = Colors.red;
  Color dot2 = Colors.blue;
  Color dot3 = Colors.green;
  Color dot4 = Colors.yellow;
  Color dot5 = Colors.orange;

  @override
  void initState() {
    super.initState();
    dotRow = buildDotRow(5, [dot1, dot2, dot3, dot4, dot5]);
    countdown = 10 * 60 * 60; // 10 hours
    startCountdown();
  }


  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          // Countdown is complete, you can add any additional logic here
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  String formatCountdown() {
    int hours = countdown ~/ 3600;
    int minutes = (countdown % 3600) ~/ 60;
    int seconds = countdown % 60;
    return '$hours Hour ${minutes} minutes ${seconds} seconds';
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Row buildDotRow(int numberOfDots, List<Color> dotColors) {
    assert(numberOfDots == dotColors.length, 'Number of dots must match the length of dotColors');

    List<Widget> dots = List.generate(
      numberOfDots,
          (index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          Icons.circle,
          size: 6,
          color: dotColors[index],
        ),
      ),
    );

    return Row(children: dots);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Sol ikona tıklandığında yapılacak işlemler
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Sağ üstteki ilk ikona tıklandığında yapılacak işlemler
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {
              // Sağ üstteki ikinci ikona tıklandığında yapılacak işlemler
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.all(10.0),
              width: 370.0,
              height: 50.0,
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10.0),
                  Text("Search Anything..."),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // View All butonuna basıldığında yapılacak işlemler
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/fashion.png', height: 80, width: 80),
                      const Text(
                        "Fashion",
                        style: TextStyle(
                          color: Color.fromARGB(198, 54, 54, 55),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Image.asset('assets/electronic.png', height: 80, width: 80),
                      const Text(
                        "electronic",
                        style: TextStyle(
                          color: Color.fromARGB(198, 54, 54, 55),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Image.asset('assets/Appliances.png', height: 80, width: 80),
                      const Text(
                        "Appliances",
                        style: TextStyle(
                          color: Color.fromARGB(198, 54, 54, 55),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Image.asset('assets/Beauty.png', height: 80, width: 80),
                      const Text(
                        "Beauty",
                        style: TextStyle(
                          color: Color.fromARGB(198, 54, 54, 55),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Image.asset('assets/Furniture.png', height: 80, width: 80),
                      const Text(
                        "Furniture",
                        style: TextStyle(
                          color: Color.fromARGB(198, 54, 54, 55),
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              height: 154,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Center(
                    child: Image.asset("assets/your_image1.png"),
                  ),
                  Center(
                    child: Image.asset("assets/your_image1.png"),
                  ),
                  Center(
                    child: Image.asset("assets/your_image1.png"),
                  ),
                  Center(
                    child: Image.asset("assets/your_image1.png"),
                  ),
                  Center(
                    child: Image.asset("assets/your_image1.png"),
                  ),
                ],
              ),
            ),
            Container(
              width: 360,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: dotRow,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deal of the day ",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // View All butonuna basıldığında yapılacak işlemler
                    },
                    child: TextButton(
                      child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      ),onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => viewall()),
                      );
                    },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.black),
              ),
              padding: EdgeInsets.all(10.0),
              width: 250.0,
              height: 50.0,
              child: Row(
                children: [
                  SizedBox(width: 10.0),
                  Text(
                    '${formatCountdown()}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: yourCatalogList.length,
                itemBuilder: (BuildContext context, int index) {
                  final catalogItem = yourCatalogList[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.asset(
                          catalogItem.imagePath,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            catalogItem.discountText,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }




}
  class CatalogItem {
  final String imagePath;
  final String text;
  final String discountText;

  CatalogItem({
  required this.imagePath,
    required this.text,
  required this.discountText,
  });
  }

// Inside your widget class or outside if you prefer
  final List<CatalogItem> yourCatalogList = [
  CatalogItem(imagePath: 'assets/Nike-white.png',text: "Running Shoes", discountText: 'Upto 40% OFF'),
  CatalogItem(imagePath: 'assets/Sneakers.png',text: "Sneakers", discountText: '40-20% OFF'),
  CatalogItem(imagePath: 'assets/Wrist-Watches.png', text: "Wrist Watches",discountText: '20% OFF'),
    CatalogItem(imagePath: 'assets/Bluetooth-Speakers.png', text:"Bluetooth Speakers",discountText: '20% OFF'),
  ];