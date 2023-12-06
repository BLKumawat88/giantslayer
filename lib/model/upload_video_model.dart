class UploadVideo {
  final String plan;
  final String users;
  final String price;
  String radioButtonValue;

  UploadVideo({
    required this.plan,
    required this.users,
    required this.price,
    required this.radioButtonValue,
  });
}

List<UploadVideo> uploadVideo = [
  UploadVideo(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'selected',
  ),
  UploadVideo(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  UploadVideo(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  UploadVideo(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  UploadVideo(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
];
