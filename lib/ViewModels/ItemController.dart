import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:hw_mvvm_3st/Model/Item.dart';

class ItemController extends GetxController {
  final List<Item> baseItems = [
    Item(id: '1', name: 'Burger', price: 5.99),
    Item(id: '2', name: 'Pizza', price: 7.99),
    // Add more items as needed
  ];

  var items = <Item>[].obs;
  RxInt totalItems = 0.obs;
  RxDouble totalCost = 0.0.obs;

  Item? _lastRemovedItem;
  int? _lastRemovedIndex;

  @override
  void onInit() {
    super.onInit();
    updateTotals();
  }

  void addRandomItem() {
    final random = Random();
    final randomItem = baseItems[random.nextInt(baseItems.length)];
    final itemInList = items.firstWhereOrNull((item) => item.id == randomItem.id);

    if (itemInList != null) {
      itemInList.quantity.value += 1;
    } else {
      items.add(Item(
        id: randomItem.id,
        name: randomItem.name,
        price: randomItem.price,
        quantity: 1,
      ));
    }
    updateTotals();
    _showOrderSummary();
  }

  void updateQuantity(String id, int newQuantity) {
    final item = items.firstWhereOrNull((item) => item.id == id);
    if (item != null) {
      item.quantity.value = newQuantity.clamp(1, double.infinity).toInt();
      updateTotals();
    }
  }

  void removeItem(String id) {
    final item = items.firstWhereOrNull((item) => item.id == id);
    if (item != null) {
      _lastRemovedItem = item;
      _lastRemovedIndex = items.indexOf(item);
      items.remove(item);
      updateTotals();
      _showUndoSnackBar();
    }
  }

  void updateTotals() {
    totalItems.value = items.fold(0, (sum, item) => sum + item.quantity.value);
    totalCost.value = items.fold(0, (sum, item) => sum + item.price * item.quantity.value);
  }

  void _showOrderSummary() {
    String orderSummary = items.map((item) {
      return '${item.name}: ${item.quantity.value} x \$${item.price.toStringAsFixed(2)}';
    }).join('\n');

    Get.snackbar(
      'Order Added',
      'Order Details:\n$orderSummary',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.black.withOpacity(0.7),
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(10),
      duration: Duration(seconds: 3),
    );
  }

  void _showUndoSnackBar() {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text("${_lastRemovedItem?.name} removed"),
        backgroundColor: Colors.orange,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            if (_lastRemovedItem != null && _lastRemovedIndex != null) {
              items.insert(_lastRemovedIndex!, _lastRemovedItem!);
              _lastRemovedItem = null;
              _lastRemovedIndex = null;
              updateTotals();
            }
          },
        ),
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
