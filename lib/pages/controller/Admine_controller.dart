import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/food.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_stub/_file_decoder_stub.dart';

class HomeController extends GetxController {
  //call the fire store using  FirebaseFirestore.instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference foodcollection;

  //create a controller for fetch the data from text feild
  TextEditingController foodNamectrl = TextEditingController();
  TextEditingController foodDescriptionctrl = TextEditingController();
  TextEditingController foodImagectrl = TextEditingController();
  TextEditingController foodPricectrl = TextEditingController();

  //create a default value for dropdown btn
  String catagory = 'genaral';
  String shop = 'home made';
  bool offer = false;

  //store the collections data
  List<Food> foods = [];

  @override
  Future<void> onInit() async {
    //call the collection from firebasefirestore
    foodcollection = firestore.collection("foods");

    //fetchfoods
    await fetchFoods();

    super.onInit();
  }

  addfood() {
    try {
      if (foodNamectrl.text.isEmpty ||
          foodDescriptionctrl.text.isEmpty ||
          foodImagectrl.text.isEmpty ||
          foodPricectrl.text.isEmpty) {
        Get.snackbar("Success", "Please fill the fields",
            colorText: Colors.red);
        return;
      }

      //create a new document
      DocumentReference doc = foodcollection.doc();
      //create a new document feild
      Food food = Food(
        id: doc.id,
        name: foodNamectrl.text,
        category: catagory,
        description: foodDescriptionctrl.text,
        price: double.tryParse(foodPricectrl.text),
        shop: shop,
        image: foodImagectrl.text,
        offer: offer,
      );
      //convert to json formet
      final foodjson = food.toJson();
      doc.set(foodjson);

      //create a snackbar for adding successfull
      Get.snackbar("Success", "Food added successfully",
          colorText: Colors.blueGrey[400]);

      //set after adding the food_added page is empty
      setdefaultvalue();
    } catch (e) {
      //create a snackbar for any error found
      Get.snackbar("Error", e.toString(), colorText: Colors.blueGrey[400]);
    }
  }

  //this function used to fetch data from inside the foods collection.
  //document,feild data
  fetchFoods() async {
    try {
      QuerySnapshot foodsnapshot = await foodcollection.get();
      final List<Food> retraivedfoods = foodsnapshot.docs
          .map((doc) => Food.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      //clear the previous collection documents
      foods.clear();

      //assign new data to the collection
      foods.assignAll(retraivedfoods);

      Get.snackbar("Success", "Food fetched successfully",
          colorText: Colors.blueGrey[400]);
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.blueGrey[400]);
    } finally {
      update();
    }
  }

//delete the food items
  deletefood(String id) {
    try {
      foodcollection.doc(id).delete();
      fetchFoods();
    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
    }
  }

  //set after adding the food_added page is empty
  setdefaultvalue() {
    foodNamectrl.clear();
    foodDescriptionctrl.clear();
    foodImagectrl.clear();
    foodPricectrl.clear();

    catagory = 'genaral';
    shop = 'home made';
    offer = false;
    update();
  }
}
