import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'base_screen_size.dart';

abstract class BaseView<T> extends GetView{

  @override
  T get controller => GetInstance().find<T>(tag: tag)!;

  Function wp = Screen(MediaQuery.sizeOf(Get.context!)).wp;
  Function hp = Screen(MediaQuery.sizeOf(Get.context!)).hp;

  @override
  Widget build(BuildContext context);
}