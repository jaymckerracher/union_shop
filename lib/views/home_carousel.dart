import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _currentIndex = 0;

  final List<_CarouselSlide> _slides = [
    const _CarouselSlide(
      image: 'images/essential_tee/blue.webp',
      title: 'Essential Range',
      description:
          'Save over 20% on our Essential Range! Grab yours while stocks last.',
    ),
    const _CarouselSlide(
      image: 'images/classic_hoodie/blue.webp',
      title: 'Classic Hoodie',
      description:
          'Discover our timeless Classic Hoodie – comfort and style for every season.',
    ),
    const _CarouselSlide(
      image: 'images/merch/cotton_tote.webp',
      title: 'Merchandise',
      description:
          'Check out our exclusive merchandise – perfect for every student!',
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            itemCount: _slides.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final slide = _slides[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        slide.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    slide.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    slide.description,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_slides.length, (index) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.purple : Colors.grey,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _CarouselSlide {
  final String image;
  final String title;
  final String description;

  const _CarouselSlide({
    required this.image,
    required this.title,
    required this.description,
  });
}
