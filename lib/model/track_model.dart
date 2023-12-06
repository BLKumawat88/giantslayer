class TrackModel {
  final String plan;
  final String location;
  final String price;
  String radioButtonValue;

  TrackModel({
    required this.plan,
    required this.location,
    required this.price,
    required this.radioButtonValue,
  });
}

List<TrackModel> trackModel = [
  TrackModel(
    plan: 'Plan 1',
    location: '0-1',
    price: '10',
    radioButtonValue: 'selected',
  ),
  TrackModel(
    plan: 'Plan 2',
    location: '0-1',
    price: '20',
    radioButtonValue: 'unselected',
  ),
  TrackModel(
    plan: 'Plan 3',
    location: '0-1',
    price: '30',
    radioButtonValue: 'unselected',
  ),
  TrackModel(
    plan: 'Plan 4',
    location: '0-1',
    price: '40',
    radioButtonValue: 'unselected',
  )
];
