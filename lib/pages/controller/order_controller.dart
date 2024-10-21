import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference ordercollection;

  List<Orders> order1 = [];

  @override
  Future<void> onInit() async {
    //call the collection from firebasefirestore
    ordercollection = firestore.collection("orders");

    //fetchorders
    await fetchorders();
    super.onInit();
  }

  fetchorders() async {
    try {
      QuerySnapshot orderSnapshot = await ordercollection.get();
      final List<Orders> retraivedOrders = orderSnapshot.docs
          .map((doc) => Orders.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      //clear the previous collection documents
      order1.clear();

      //assign new data to the collection
      order1.assignAll(retraivedOrders);
      Get.snackbar("Success", 'Food fetched successfully',
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
    } finally {
      update();
    }
  }

  // deleteOrder(String id) {
  //   try {
  //     ordercollection.doc(id).delete();
  //     fetchorders();
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString(), colorText: Colors.red);
  //   } finally {
  //     update();
  //   }
  // }
}
