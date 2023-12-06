import 'package:flutter/animation.dart';

class VideoList {
  final String image;
  final String videoName;
  final String views;
  final String planName;
  final String availableAdSlots;
  final String ppv;
  final String svod;
  final String status;
  final Color color;

  VideoList({
    required this.image,
    required this.videoName,
    required this.views,
    required this.planName,
    required this.availableAdSlots,
    required this.ppv,
    required this.svod,
    required this.status,
    required this.color,
  });
}

List<VideoList> videoList = [
  VideoList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost In Space',
    views: '133',
    planName: 'Plan Name',
    availableAdSlots: '10',
    ppv: 'PPV',
    svod: 'PPV/SVOD',
    status: 'Approved',
    color: Color(0xFF166534),
  ),
  VideoList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost In Space',
    views: '100',
    planName: 'Plan Name',
    availableAdSlots: '10',
    ppv: 'PPV',
    svod: 'PPV/SVOD',
    status: 'Pending Approval',
    color: Color(0xFFFF0000),
  ),
  VideoList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost In Space',
    views: '200',
    planName: 'Plan Name',
    availableAdSlots: '10',
    ppv: 'PPV',
    svod: 'PPV/SVOD',
    status: 'Published',
    color: Color(0xFFFFB91D),
  ),
  VideoList(
      image: 'assets/images/place_add.png',
      videoName: 'Lost In Space',
      views: '133',
      planName: 'Plan Name',
      availableAdSlots: '10',
      ppv: 'PPV',
      svod: 'PPV/SVOD',
      status: 'Approved',
      color: Color(0xFF166534)),
  VideoList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost In Space',
    views: '100',
    planName: 'Plan Name',
    availableAdSlots: '10',
    ppv: 'PPV',
    svod: 'PPV/SVOD',
    status: 'Pending Approval',
    color: Color(0xFFFF0000),
  ),
  VideoList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost In Space',
    views: '200',
    planName: 'Plan Name',
    availableAdSlots: '10',
    ppv: 'PPV',
    svod: 'PPV/SVOD',
    status: 'Published',
    color: Color(0xFFFFB91D),
  ),
];
