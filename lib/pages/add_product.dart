import 'package:flutter/material.dart';
import 'package:food_delivery/pages/controller/Admine_controller.dart';
import 'package:food_delivery/widgets/drop_down_btn.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class newprodect extends StatelessWidget {
  const newprodect({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Center(child: Text("Add Food"))),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add New Food",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey[400],
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: ctrl.foodNamectrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text("Food Name"),
                      hintText: "Enter Your Food Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.foodDescriptionctrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text("Food description"),
                      hintText: "Enter Your Food description"),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.foodImagectrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text("Image URL"),
                      hintText: "Enter Your Image URL"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.foodPricectrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: Text("Food Price"),
                      hintText: "Enter Your Food Price"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: [
                        "snacks",
                        "breakfast",
                        "lunch",
                        "dinner",
                        "drinks"
                      ],
                      selectedTextitem: ctrl.catagory,
                      onselected: (selectedValue) {
                        ctrl.catagory = selectedValue ?? 'genaral';
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: [
                        "anbuselvi tea stal",
                        "aryabhavan",
                        "sathya",
                        "MalaiRam",
                        "A1"
                      ],
                      selectedTextitem: ctrl.shop,
                      onselected: (selectedValue) {
                        ctrl.shop = selectedValue ?? 'home made';
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Offer Food?',
                ),
                DropDownBtn(
                  items: ["True", "False"],
                  selectedTextitem: ctrl.offer.toString(),
                  onselected: (selectedValue) {
                    ctrl.offer = (selectedValue?.toLowerCase() == "true");
                    ctrl.update();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[400],
                        foregroundColor: Colors.white),
                    onPressed: () {
                      ctrl.addfood();
                    },
                    child: Text("Add Food"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
