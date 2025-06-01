import 'package:flutter/material.dart';
import 'package:ecommerce_app/profile.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) return; // Ignore clik on cart icon

    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      // Navigate to profile screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      ).then((_) {
        // Reset selected index to home when returning from profile
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://skiexchange.co.uk/cdn/shop/products/leonardo-2000--1.jpg?v=1657985794&width=640';
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'نيو بيض',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Consumer<UserProvider>(
                builder:
                    (context, userProvider, _) => Text(
                      userProvider.username.isEmpty
                          ? 'Welcome Guest'
                          : 'Welcome ${userProvider.username}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
              ),
            ),
          ],
        ),
        actions: [
          // stylizing the bell icon
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(8),
            ),
            color: Color.fromARGB(255, 0, 0, 0),
            padding: const EdgeInsets.all(10),
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(68, 190, 190, 190),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products',
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 190, 190, 190),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hyper',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF152e1a),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$99.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152e1a),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 190, 190, 190),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hyper',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF152e1a),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$99.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152e1a),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 190, 190, 190),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hyper',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF152e1a),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$99.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152e1a),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 190, 190, 190),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hyper',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF152e1a),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.pink,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      imageUrl,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$99.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF152e1a),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF152e1a),
        onTap: _onItemTapped,
      ),
    );
  }
}
