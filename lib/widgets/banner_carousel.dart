import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'safe_network_image.dart';

class _BannerData {
  final String title;
  final String subtitle;
  final String image;
  final String category; // where the banner "links" to

  const _BannerData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.category,
  });
}

const List<_BannerData> _banners = [
  _BannerData(
    title: 'Summer Sale',
    subtitle: 'Up to 50% off on fashion',
    image: 'assets/images/summersale.webp',
    category: 'Fashion',
  ),
  _BannerData(
    title: 'New Arrivals',
    subtitle: 'Fresh picks just for you',
    image: 'assets/images/arrivals.webp',
    category: 'All',
  ),
  _BannerData(
    title: 'Electronics Discount',
    subtitle: 'Best deals on gadgets',
    image: 'assets/images/electronicsale.webp',
    category: 'Electronics',
  ),
];


class BannerCarousel extends StatefulWidget {

  final void Function(String category) onBannerTap;

  const BannerCarousel({super.key, required this.onBannerTap});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) => setState(() => _current = index),
          ),
          items: _banners.map((b) {
            return GestureDetector(
              onTap: () => widget.onBannerTap(b.category),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SafeNetworkImage(url: b.image),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.black87, Colors.transparent],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      right: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            b.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            b.subtitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_banners.length, (i) {
            final active = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: active ? Colors.deepOrange : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
