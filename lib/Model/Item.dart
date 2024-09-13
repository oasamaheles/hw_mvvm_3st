import 'package:get/get.dart';

class Item {
  String id;
  String name;
  double price;
  RxInt quantity;

  Item({
    required this.id,
    required this.name,
    required this.price,
    int quantity = 1,
  }) : this.quantity = RxInt(quantity);
}
