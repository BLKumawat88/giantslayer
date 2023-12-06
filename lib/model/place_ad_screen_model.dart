import 'package:flutter/animation.dart';

class PlaceAdScreen {
  final String image;
  final String title;
  final String viewed;
  final String impressions;
  final String thumpsup;
  final String clicks;
  final String survey;
  final String status;
  final Color color;

  PlaceAdScreen({
    required this.image,
    required this.title,
    required this.viewed,
    required this.impressions,
    required this.thumpsup,
    required this.clicks,
    required this.survey,
    required this.status,
    required this.color,
  });
}

List<PlaceAdScreen> placeAdScreen = [
  PlaceAdScreen(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    viewed: '133K',
    impressions: '1450',
    thumpsup: '10',
    clicks: '2',
    survey: '2',
    status: 'Active',
    color: Color(0xFF166534),
  ),
  PlaceAdScreen(
    image: 'assets/images/place_add.png',
    title: 'Video on which ad placed',
    viewed: '133K',
    impressions: '1450',
    thumpsup: '10',
    clicks: '2',
    survey: '2',
    status: 'Inactive',
    color: Color(0xFF991B1B),
  ),
  PlaceAdScreen(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    viewed: '133K',
    impressions: '1450',
    thumpsup: '10',
    clicks: '2',
    survey: '2',
    status: 'Active',
    color: Color(0xFF166534),
  ),
  PlaceAdScreen(
    image: 'assets/images/place_add.png',
    title: 'Video on which ad placed',
    viewed: '133K',
    impressions: '1450',
    thumpsup: '10',
    clicks: '2',
    survey: '2',
    status: 'Inactive',
    color: Color(0xFF991B1B),
  )
];
