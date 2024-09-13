import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hw_mvvm_3st/ViewModels/ItemController.dart';
import 'package:hw_mvvm_3st/ViewModels/login_controller.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ItemController controller = Get.find();
    final LoginController loginController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 22),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Center(
              child: Text('Basket',
                  style: TextStyle(color: Colors.black, fontSize: 17))),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return Dismissible(
                    key: ValueKey(item.id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      controller.removeItem(item.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${item.name} removed"),
                          backgroundColor: Colors.orange,
                          action: SnackBarAction(
                            label: 'Undo',
                            textColor: Colors.white,
                            onPressed: () {
                              controller.addRandomItem();
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
                    },
                    background: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(Icons.delete, color: Colors.white, size: 40),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete, color: Colors.white, size: 40),
                          ),
                        ],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white54.withOpacity(0.5),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12.0),
                        leading: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/burger.jpg',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}'),
                        trailing: SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 1),
                                ),
                                height: 35,
                                width: 35,
                                child: IconButton(
                                  padding: EdgeInsets.all(5),
                                  icon: Icon(Icons.remove, color: Colors.black, size: 25),
                                  onPressed: () {
                                    if (item.quantity.value > 0) {
                                      controller.updateQuantity(item.id, item.quantity.value - 1);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 8.0),
                              Obx(() => Text('${item.quantity.value}', style: TextStyle(fontSize: 20))),
                              SizedBox(width: 8.0),
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 1),
                                ),
                                height: 35,
                                width: 35,
                                child: IconButton(
                                  padding: EdgeInsets.all(5),
                                  icon: Icon(Icons.add, color: Colors.black),
                                  onPressed: () {
                                    controller.updateQuantity(item.id, item.quantity.value + 1);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );


                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
            padding: EdgeInsets.all(16.0),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.orange[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Icon(Icons.shop_outlined, size: 30, color: Colors.amber),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                              SizedBox(height: 8.0),
                              Obx(() => Padding(
                                padding: const EdgeInsets.only(left: 50.0),
                                child: Text('${controller.totalItems}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              )),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cost', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                              SizedBox(height: 8.0),
                              Obx(() => Text('\$${controller.totalCost.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addRandomItem();
                    },
                    child: Text('Add Order'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0), // Padding
                      textStyle: TextStyle(fontSize: 18), // Text style
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
