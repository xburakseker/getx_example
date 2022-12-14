import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_example/controller/controller.dart';
import 'package:getx_example/controller/messages.dart';
import 'package:getx_example/second_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Get.deviceLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                '${controller.sayac}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const SecondPage());
                },
                child: const Text("Second Page")),
            ElevatedButton(
                onPressed: () {
                  controller.temaDegistir();
                },
                child: const Text("Change Theme")),
            Obx(
              () => Text(
                '${controller.sayacBesArti}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.sayacBesArttir();
                },
                child: const Text("Sayac?? Bes Artt??r")),
            ElevatedButton(
                onPressed: () {
                  controller.sayacBesAzalt();
                },
                child: const Text("Sayac?? Bes Azalt")),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar('Ramo', 'Burak');
                },
                child: const Text("Getx Snackbar")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(title: 'Burak Dialog', middleText: "RAMOOOO");
                },
                child: const Text("Getx Dialog")),
            Text('hello'.tr),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(const Locale("tr", "TR"));
                },
                child: Text('dil'.tr)),
          ],
        ),
      ),
      floatingActionButton: Column(
        children: [
          const SizedBox(
            height: 650,
          ),
          FloatingActionButton(
            heroTag: "buton1",
            onPressed: () {
              controller.sayacArttir();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            heroTag: "buton2",
            onPressed: () {
              controller.sayacAzalt();
            },
            tooltip: 'Decrement',
            child: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Icon(Icons.minimize),
            ),
          ),
        ],
      ),
    );
  }
}
