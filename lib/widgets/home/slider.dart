import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VxSwiper(
      scrollDirection: Axis.horizontal,
      items: [
        Container(
            color: Colors.blue,
            child: Image.network(
              "https://pub-static.haozhaopian.net/assets/projects/pages/3d4d74c0-f53c-11e9-9514-3f31cfb386e6_12ddd30c-5a94-4145-9034-5c6b0a462df2_thumb.jpg",
              fit: BoxFit.fill,
            )).w(context.screenWidth),
        Container(
            color: Colors.blue,
            child: Image.network(
              "https://st2.depositphotos.com/7341970/11081/v/950/depositphotos_110819108-stock-illustration-grocery-shopping-discount-banner.jpg",
              fit: BoxFit.fill,
            )).w(context.screenWidth),
      ],
      viewportFraction: context.isMobile ? 1.0 : 1.0,
      autoPlay: true,
      autoPlayAnimationDuration: 2.seconds,
    )
        .h(context.isMobile
            ? context.screenHeight * 0.2
            : context.screenHeight * 0.5)
        .w(context.isMobile ? context.screenWidth : context.screenWidth);
  }
}
