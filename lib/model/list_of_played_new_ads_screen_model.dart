import 'package:flutter/animation.dart';

class ListOfPlayedNewAdsModel {
  final String image;
  final String title;
  final String status;
  final Color color;

  ListOfPlayedNewAdsModel({
    required this.image,
    required this.title,
    required this.status,
    required this.color,
  });
}

List<ListOfPlayedNewAdsModel> listOfPlayedNewAdsModel = [
  ListOfPlayedNewAdsModel(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    status: 'Approved',
    color: Color(0xFF166534),
  ),
  ListOfPlayedNewAdsModel(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    status: 'Pending',
    color: Color(0xFFFFB91D),
  ),
  ListOfPlayedNewAdsModel(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    status: 'Approved',
    color: Color(0xFF166534),
  ),
  ListOfPlayedNewAdsModel(
    image: 'assets/images/place_add.png',
    title: 'Lost in Space',
    status: 'Approved',
    color: Color(0xFF166534),
  ),
];
