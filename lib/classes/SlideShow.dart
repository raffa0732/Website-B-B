import 'dart:async';
import 'package:flutter/material.dart';

class ImageSlideShow extends StatefulWidget {
  const ImageSlideShow({super.key});

  @override
  State<ImageSlideShow> createState() => _ImageSlideShowState();
}

class _ImageSlideShowState extends State<ImageSlideShow> {
  final PageController _pageController = PageController();
  final List<String> _imagePaths = [
    'images/camera1.jpeg',
    'images/camera2.jpeg',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _nextPage();
    });
  }

  void _nextPage() {
    _currentIndex = (_currentIndex + 1) % _imagePaths.length;
    _animateToPage();
  }

  void _previousPage() {
    _currentIndex =
        (_currentIndex - 1 + _imagePaths.length) % _imagePaths.length;
    _animateToPage();
  }

  void _animateToPage() {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 750,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Image Slider
              PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                  _startAutoSlide();
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _imagePaths[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
              ),

              /// Previous Button
              Positioned(
                left: 12,
                child: _navButton(
                  icon: Icons.chevron_left,
                  onTap: _previousPage,
                ),
              ),

              /// Next Button
              Positioned(
                right: 12,
                child: _navButton(
                  icon: Icons.chevron_right,
                  onTap: _nextPage,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        /// Indicatori
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _imagePaths.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == index ? 14 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Colors.blue
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 
  Widget _navButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
        _startAutoSlide();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
