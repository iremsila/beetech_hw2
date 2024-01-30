import 'package:flutter/material.dart';

class viewall extends StatefulWidget {
  const viewall({Key? key}) : super(key: key);

  @override
  State<viewall> createState() => _viewallState();
}

class _viewallState extends State<viewall> {
  int _currentIndex = 0; // Track the currently selected item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hot Selling Footwear",
                  style: TextStyle(
                    fontSize: 18.0, // Daha büyük yazı boyutu
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // View All butonuna basıldığında yapılacak işlemler
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 14, // Daha büyük yazı boyutu
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildProductItem('assets/adidas.png', 'Adidas White Sneaker', 4.8,'\$80.00'),
                  SizedBox(width: 15),
                  _buildProductItem('assets/Nike.png', 'Nike Sneaker', 4.2,'\$120.00'),
                  SizedBox(width: 15),
                  _buildProductItem('assets/Shoes.png', 'Normal Sneaker', 3.5,'\$150.00'),
                  SizedBox(width: 15),
                  _buildProductItem('assets/Sneakers.png', 'White Sneakers',2.7,'\$100.00')
                ],
              ),
            ),
            _buildSection("Recommended for you", [
              _buildProductItem('assets/Allen-Solly.png', 'Allen Solly Regular \n fit cotton shirt', 4.4, '\$50.00'),
              SizedBox(width: 15),
              _buildProductItem('assets/Calvin-Clein.png', 'Calvin Clein Regular \n fit slim fit shirt', 4.2, '\$70.00'),
              SizedBox(width: 15),
              _buildProductItem('assets/H&P.png', 'H&P Regular \n fit shirt', 4.1, '\$40.00'),
              SizedBox(width: 15),
              _buildProductItem('assets/takim elbise.jpg', 'Black Suit', 4.9, '\$200.00'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 32.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse_outlined, size: 32.0),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.person, size: 32.0),
                Positioned(
                  right: 0,
                  child: Icon(Icons.brightness_1, size: 8.0, color: Colors.red),
                ),
              ],
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imagePath, String title, double rating, String price) {
    return Column(
      children: [
        Image.asset(imagePath, height: 120, width: 120),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.yellow, size: 16),
            Text(
              '$rating',
              style: TextStyle(
                color: Color.fromARGB(198, 54, 54, 55),
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(198, 54, 54, 55),
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Color.fromARGB(198, 54, 54, 55),
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // View All butonuna basıldığında yapılacak işlemler
              },
              child: Text(
                "View All",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items,
          ),
        ),
      ],
    );
  }
}