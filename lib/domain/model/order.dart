class Order {
  String orderId;
  DateTime datePlaced;
  bool isComplete;

  Order(
      {required this.orderId,
      required this.datePlaced,
      required this.isComplete});
}
