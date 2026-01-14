import 'package:flutter/material.dart';
import 'package:website/pages/explore.dart';
import 'package:website/classes/footer.dart';

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
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomHotelAppBar(),
         body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: const [
              SizedBox(
                height: 600, // Altezza di esempio per spingere il footer in basso
                child: Center(
                child: Text(
                  'Welcome to B&B Via Castello!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),        
                  ),
              ),
              ),
              BBViaCastelloFooter(),
            ],
          ),
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
              _menuItem("Home", isActive: true, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
              _menuItem("Explore", isActive: false, onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EsploraCremaSection()));
              }),
              _camereDropdown(context),
              _menuItem("Meetings & Events", isActive: false),
            ],
          ),
        ],
      ),
    );
    
  }

  static Widget _menuItem(String text, {bool isActive = false, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style:TextStyle(
            fontSize: 15,
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static Widget _camereDropdown(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 32),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 8,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
            color: Colors.black87,
          ),
          hint: Row(
            children: const [
              Text(
                "Camere",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: 4),
            ],
          ),
          items: const [
            DropdownMenuItem(
              value: "stella",
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Stella",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            DropdownMenuItem(
              value: "sole_luna",
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Sole e Luna",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value == "stella") {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => const StellaPage()));
            } else if (value == "sole_luna") {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => const SoleLunaPage()));
            }
          },
        ),
      ),
    ),
  );
}

}