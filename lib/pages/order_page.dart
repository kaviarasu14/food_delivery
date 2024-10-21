import 'package:flutter/material.dart';
import 'package:food_delivery/pages/controller/order_controller.dart';
import 'package:get/get.dart';

class orderpage extends StatelessWidget {
  const orderpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (ctrl) {
      return Scaffold(
        //appbar
        appBar: AppBar(
          title: Center(child: Text("Orders")),
        ),
        body: ListView.builder(
          itemCount: ctrl.order1.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: ListTile(
                title: Text(ctrl.order1[index].item ?? ''),
                subtitle: Text((ctrl.order1[index].price ?? "0").toString()),
                trailing: IconButton(
                    onPressed: () {
                      //ctrl.deleteOrder(ctrl.order[index].id ?? '');
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          },
        ),
      );
    });
  }
}
