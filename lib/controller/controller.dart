import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  RxInt sayac = 0.obs;
  RxBool isDark = false.obs;

  GetStorage getStorage = GetStorage();

  temaKaydet(bool deger) {
    getStorage.write("isDark", deger);
  }

  sayacArttir() {
    sayac.value++;
  }

  sayacAzalt() {
    sayac.value--;
  }

  temaDegistir() {
    isDark.value = !isDark.value;

    isDark.value ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light());
    temaKaydet(isDark.value);
  }

  @override
  void onInit() {
    bool deger = getStorage.read("isDark") ?? false;
    deger ? Get.changeTheme(ThemeData.dark()) : Get.changeTheme(ThemeData.light());
    // TODO: implement onInit
    super.onInit();
  }
}
