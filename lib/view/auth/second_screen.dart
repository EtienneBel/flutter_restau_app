import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restau_app/core/view_model/auth_view_model.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AuthViewModel authViewModel = Get.put(AuthViewModel());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Obx(() => Text("${authViewModel.counter.value}")),
          ElevatedButton(
            child: Text('increment'),
            onPressed: () {
              // authViewModel.increment();
            },
          ),
        ],
      ),
    );
  }
}
