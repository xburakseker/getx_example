import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.find();
    return Scaffold(
      body: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SizedBox(
              width: 100,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 35,
              ),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.black,
            child: Text(
              "${controller.sayac}",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
