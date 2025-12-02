import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHotelAppBar(),
      body: const Center(
        child: Text(
          "SLIDESHOW IMMAGINI B&B (5/6 IMMAGINI)",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class CustomHotelAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHotelAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "B&B",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2,
                ),
              ),
              Text(
                "VIA CASTELLO, CREMA",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              _menuItem("Home", isActive: true),
              _menuItem("Explore"),
              _menuItem("Amenities"),
              _menuItem("Meetings & Events"),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _menuItem(String text, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
        ),
      ),
    );
  }
}
