import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PosterCarousel extends StatefulWidget {
  const PosterCarousel({super.key, required this.imagesUrl});

  // final List<String> moviesId;
  final List<String> imagesUrl;

  @override
  State<PosterCarousel> createState() => _PosterCarouselState();
}

class _PosterCarouselState extends State<PosterCarousel> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              itemCount: widget.imagesUrl.length,
              itemBuilder: (context, index, realIndex) {
                final sliderImage = widget.imagesUrl[index];
                return buildImage(sliderImage, index);
              },
              options: CarouselOptions(
                height: 300.0,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 5),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
            Positioned.fill(
              bottom: 16.0, // Adjust the position as needed
              child: Align(
                alignment: Alignment.bottomCenter,
                child: buildIndicator(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) => Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Image.network(
              urlImage,
              fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
            ),
          );
        },
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: widget.imagesUrl.length,
        effect: const ExpandingDotsEffect(
            activeDotColor: Color.fromRGBO(50, 168, 115, 1),
            dotWidth: 10.0,
            dotHeight: 10.0),
      );
}
