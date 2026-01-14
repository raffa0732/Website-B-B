import 'package:flutter/material.dart';

class ImageSlideShow extends StatefulWidget{
  const ImageSlideShow({super.key});

  @override
  State<ImageSlideShow> createState() => _ImageSlideShowState();
}

class _ImageSlideShowState extends State<ImageSlideShow> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/images/slide1.jpg',
    'assets/images/slide2.jpg',
    'assets/images/slide3.jpg',
  ];

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5), _autoSlide);
  }

  void _autoSlide() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    });
    Future.delayed(const Duration(seconds: 5), _autoSlide);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          return Image.asset(
            _imagePaths[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}