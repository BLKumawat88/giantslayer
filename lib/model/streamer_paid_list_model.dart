class StreamerPaidList {
  final String image;
  final String videoName;
  final String date;
  final String time;
  final String planChoosen;

  StreamerPaidList({
    required this.image,
    required this.videoName,
    required this.date,
    required this.time,
    required this.planChoosen,
  });
}

List<StreamerPaidList> streamerPaidList = [
  StreamerPaidList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost in Space',
    date: '',
    time: '',
    planChoosen: 'Plan Choosen',
  ),
  StreamerPaidList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost in Space',
    date: '',
    time: '',
    planChoosen: 'Plan Choosen',
  ),
];
