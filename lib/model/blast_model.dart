class BlastModel {
  final String plan;
  final String users;
  final String price;
  String radioButtonValue;

  BlastModel({
    required this.plan,
    required this.users,
    required this.price,
    required this.radioButtonValue,
  });
}

List<BlastModel> blastModel = [
  BlastModel(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'selected',
  ),
  BlastModel(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  BlastModel(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  BlastModel(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
  BlastModel(
    plan: '0-100',
    users: '0-100',
    price: '2',
    radioButtonValue: 'unselected',
  ),
];
