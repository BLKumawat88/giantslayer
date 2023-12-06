class StreamerUnapprovedList {
  final String image;
  final String videoName;
  final String date;
  final String time;
  final String planChoosen;

  StreamerUnapprovedList({
    required this.image,
    required this.videoName,
    required this.date,
    required this.time,
    required this.planChoosen,
  });
}

List<StreamerUnapprovedList> streamerUnapprovedList = [
  StreamerUnapprovedList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost in Space',
    date: '',
    time: '',
    planChoosen: 'Plan Choosen',
  ),
  StreamerUnapprovedList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost in Space',
    date: '',
    time: '',
    planChoosen: 'Plan Choosen',
  ),
  StreamerUnapprovedList(
    image: 'assets/images/place_add.png',
    videoName: 'Lost in Space',
    date: '',
    time: '',
    planChoosen: 'Plan Choosen',
  ),
];
