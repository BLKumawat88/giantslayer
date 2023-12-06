class PayPerViewModel {
  final String days;
  final String description;
  final String price;
  final String radioButtonValue;

  PayPerViewModel({
    required this.days,
    required this.description,
    required this.price,
    required this.radioButtonValue,
  });
}

List<PayPerViewModel> payPerViewModel = [
  PayPerViewModel(
    days: '1 Day',
    description: 'Ads free Movies and Tv Shows Live, Upcoming',
    price: '2',
    radioButtonValue: 'selected',
  ),
  PayPerViewModel(
    days: '2 Day',
    description: 'Ads free Movies and Tv Shows Live, Upcoming',
    price: '2',
    radioButtonValue: 'selected',
  ),
  PayPerViewModel(
    days: '5 Day',
    description: 'Ads free Movies and Tv Shows Live, Upcoming',
    price: '5',
    radioButtonValue: 'selected',
  ),
  PayPerViewModel(
    days: '7 Day',
    description: 'Ads free Movies and Tv Shows Live, Upcoming',
    price: '7',
    radioButtonValue: 'selected',
  ),
];
