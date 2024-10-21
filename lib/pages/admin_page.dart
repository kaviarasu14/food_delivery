import 'package:flutter/material.dart';
import 'package:food_delivery/pages/add_product.dart';
import 'package:food_delivery/pages/controller/Admine_controller.dart';
import 'package:food_delivery/pages/order_page.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        //appbar
        appBar: AppBar(
          title: Center(child: Text("Admin")),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => orderpage());
                  },
                  icon: Icon(
                    Icons.delivery_dining_rounded,
                    size: 38,
                  )),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: ctrl.foods.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: ListTile(
                title: Text(ctrl.foods[index].name ?? ''),
                subtitle: Text((ctrl.foods[index].price ?? "0").toString()),
                trailing: IconButton(
                    onPressed: () {
                      ctrl.deletefood(ctrl.foods[index].id ?? '');
                    },
                    icon: Icon(Icons.delete)),
              ),
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey[400],
          foregroundColor: Colors.white,
          onPressed: () {
            Get.to(() => newprodect());
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
